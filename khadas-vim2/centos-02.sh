#!/bin/sh
set -ex

. ./common-functions.sh

c_nameserver 1.1.1.1

if [ -f ./etc/fstab ]; then
  mv ./etc/fstab ./etc/fstab.rpmdefault
fi

echo "UUID=deadbeef-dead-beef-dead-beefdeadbeef /                       ext4     defaults        0 0" > ./etc/fstab

i_kernel_khadas_vim2_419

passwd root
adduser -c '' centos
usermod -aG adm,cdrom,wheel,dialout centos
passwd centos

touch /etc/sysconfig/network
