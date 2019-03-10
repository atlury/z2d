#!/bin/sh
set -ex

. ./common-functions.sh

yum install -y ntp ntpdate
chkconfig ntpd on
ntpdate pool.ntp.org

timedatectl set-timezone Europe/Berlin
localectl set-locale LANG=en_GB.UTF-8
hostnamectl set-hostname kvim2 --static
hostnamectl set-hostname "Khadas VIM2" --pretty

c_yum_list_epel_aarch64
c_yum_list_f25_second
i_base_centos

c_docker_centos_fedora

#c_fw_utils "/dev/mmcblk0 0x7400000 0x10000 0x200"
c_fw_utils "/dev/mmcblk0 0x06c00000 0x10000 0x200"
