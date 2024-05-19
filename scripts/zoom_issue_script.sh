#!/bin/bash
#Created By yadav.deepak@byjus.com
SY_Serial=$(cat /sys/class/dmi/id/product_serial)
hostnamectl set-hostname $SY_Serial.tnl.com
echo $SY_Serial.tnl.com > /etc/hostname
pkill -9 yum
echo "Performing repo configuration" >> /mnt/inux_log.log
mkdir /mnt/backup_old_repo
mv /etc/yum.repos.d/* /mnt/backup_old_repo
wget http://172.16.8.62/fedora35/repo_local/fedora_35/fedora35_byjus_local.repo -P /etc/yum.repos.d/
pkill -9 yum
yum install -y pulseaudio-utils openssh-server
yum update -y google-chrome-stable.x86_64
yum install -y https://cdn-cf.zoom.us/prod/5.11.10.4400/zoom_x86_64.rpm
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config 
systemctl restart sshd.service
rm -rf zoom_issue_script.sh

