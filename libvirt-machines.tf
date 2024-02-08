terraform {
  required_version = ">= 0.13"
  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = "0.7.6"
    }
    ct = {
      source  = "poseidon/ct"
      version = "0.13.0"
    }
  }
}

provider "libvirt" {
  uri = "qemu:///system"
}

resource "libvirt_pool" "volumetmp" {
  name = "entorno-testing-pool"
  type = "dir"
  path = "/var/tmp/entorno-testing-pool"
}

resource "libvirt_volume" "base" {
  name   = "flatcar-base"
  source = var.base_image
  pool   = libvirt_pool.volumetmp.name
  format = "qcow2"
}

resource "libvirt_volume" "vm-disk" {
  for_each      = toset(var.machines)
  name          = "${var.cluster_name}-${each.value}.qcow2"
  base_volume_id = libvirt_volume.base.id
  pool           = libvirt_pool.volumetmp.name
  format         = "qcow2"
}

data "ct_config" "ignition" {
  for_each = toset(var.machines)

  content = templatefile("${path.module}/cl/${each.value}.yaml.tmpl", {
    ssh_keys = join("\n", var.ssh_keys)
  })
}

resource "libvirt_domain" "machine" {
  for_each = toset(var.machines)

  name     = "${var.cluster_name}-${each.value}"
  vcpu     = var.virtual_cpus
  memory   = var.virtual_memory

  cloudinit = data.ct_config.ignition[each.value].rendered

  disk {
    volume_id = libvirt_volume.vm-disk[each.value].id
  }

  network_interface {
    network_name = "default"
  }

  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }

  graphics {
    type = "vnc"
  }
}
