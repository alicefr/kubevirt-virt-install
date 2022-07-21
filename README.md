# Build VM images with virt-install in containers
This setup creates 2 containers for creating and installing VM disk images withcontainers.

## Build the images:
```bash
make build
```

## Run the containers
Launch the 2 containers:
```bash
./virt-install-setup.sh
```

## Example
```bash
docker exec -ti virt-install bash
mkdir -p /var/run/libvirt/images
curl -L -o /var/run/libvirt/images/Fedora-Cloud-Base-36-1.5.x86_64.qcow2 https://download.fedoraproject.org/pub/fedora/linux/releases/36/Cloud/x86_64/images/Fedora-Cloud-Base-36-1.5.x86_64.qcow2
virt-install --import --name test --ram 2048   --disk path=/var/run/libvirt/images/Fedora-Cloud-Base-36-1.5.x86_64.qcow2,format=qcow2  --os-variant fedora36 --noautoconsole --network bridge=docker0
```
