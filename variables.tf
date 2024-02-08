variable "cluster_name" {
  type        = string
  description = "Cluster name used as prefix for the machine names."
}

variable "machines" {
  type        = list(string)
  description = "Machine names, corresponding to cl/machine-NAME.yaml.tmpl files."
}

variable "ssh_keys" {
  type        = list(string)
  description = "SSH public keys for user 'core'."
}

variable "base_image" {
  type        = string
  description = "Path to unpacked Flatcar Container Linux image flatcar_production_qemu_image.img."
}

variable "virtual_memory" {
  type        = number
  default     = 2048
  description = "Virtual RAM in MB."
}

variable "virtual_cpus" {
  type        = number
  default     = 1
  description = "Number of virtual CPUs."
}