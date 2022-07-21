#!/usr/bin/bash

set -xe
/usr/sbin/virtlogd &
/usr/sbin/libvirtd -l -v
