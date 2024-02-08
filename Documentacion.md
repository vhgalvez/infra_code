

# Documentacion

```bash
docker run --rm -v ${PWD}:/config quay.io/coreos/butane:release --pretty --strict /config/cl/machine-1.clc -o /config/cl/machine-1.ign
docker run --rm -v ${PWD}:/config quay.io/coreos/butane:release --pretty --strict /config/cl/machine-2.clc -o /config/cl/machine-2.ign
docker run --rm -v ${PWD}:/config quay.io/coreos/butane:release --pretty --strict /config/cl/machine-3.clc -o /config/cl/machine-3.ign
```

```bash
sudo docker run --rm -i quay.io/coreos/butane:release < /home/victory/infra_code/flatcar-infra-qemu-libvirt/cl/machine-1.yaml.tmpl | sudo tee /home/victory/infra_code/flatcar-infra-qemu-libvirt/cl/machine-1.ign > /dev/null
```

```bash
 cat libvirt-machines.tf &&  cat README.md && cat terraform.tfvars && cat variables.tf && cat cl/machine-1.yaml.tmpl && cat cl/machine-2.yaml.tmpl && cat cl/machine-3.yaml.tmpl && tree -h && cat libvirt-machines.tf &&  cat README.md && cat terraform.tfvars && cat variables.tf && cat cl/machine-1.yaml.tmpl && cat cl/machine-2.yaml.tmpl && cat cl/machine-3.yaml.tmpl && tree -h  && cat outputs.tf
 ```

 https://github.com/flatcar/container-linux-config-transpiler/releases
```bash
 sudo wget https://github.com/flatcar/container-linux-config-transpiler/archive/refs/tags/v0.9.4.tar.gz
 ```

```bash
sudo tar -xvf v0.9.4.tar.gz
```

