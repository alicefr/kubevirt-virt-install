#!/bin/bash
docker volume create libvirt-run
docker run \
  --name libvirtd \
  --net=host \
  --pid=host \
  --ipc=host \
  --user=root \
  --privileged \
  --security-opt label=disable \
  --volume=libvirt-run:/var/run/libvirt \
  --volume=libvirt-run:/run/libvirt \
  --tty=true \
  --detach=true \
  libvirtd 

docker run \
  --name virt-install \
  --user=root \
  --privileged \
  --entrypoint /bin/sh \
  --security-opt label=disable \
  --volume=/dev:/host-dev \
  --volume=/sys:/host-sys \
  --volume=libvirt-run:/var/run/libvirt \
  --volume=libvirt-run:/run/libvirt \
  --tty=true \
  --detach=true \
  virt-install
