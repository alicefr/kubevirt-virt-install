CONT_RUNTIME ?= docker

build-libvirtd:
	$(CONT_RUNTIME) build -t libvirtd -f dockerfiles/Dockerfile.libvirt dockerfiles

build-virt-install:
	$(CONT_RUNTIME) build -t virt-install -f  dockerfiles/Dockerfile.virt-install dockerfiles

build: build-libvirtd build-virt-install
