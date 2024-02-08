

# Documentacion

```bash
docker run --rm -v ${PWD}:/config quay.io/coreos/butane:release --pretty --strict /config/cl/machine-1.clc -o /config/cl/machine-1.ign
docker run --rm -v ${PWD}:/config quay.io/coreos/butane:release --pretty --strict /config/cl/machine-2.clc -o /config/cl/machine-2.ign
docker run --rm -v ${PWD}:/config quay.io/coreos/butane:release --pretty --strict /config/cl/machine-3.clc -o /config/cl/machine-3.ign
```
