#!/bin/bash

#Topic:  PXE Server.

echo "Before starting the application, Please make sure you collected below data"
echo " 1) DHCP server IP address and subnet mask."
echo " 2) Server Ehernet port name."
echo " 3) Centos ISO file location path."
echo " 4) Make sure that Bangalore repo server is on."


############ Deploy PXE Server ###############

echo "Configuring HO CentOS 7 repo"

########## HO CentoS 7 Repo ################

echo "Backing up repo"
echo "Backup directory path: /opt/repo_backup"
mkdir /opt/repo_backup
mv /etc/yum.repos.d/* /opt/repo_backup

{
echo '[base]'
echo ' '
echo 'name=CentOS-$releasever - Base'
echo 'baseurl=http://172.16.8.62/centos/$releasever/os/$basearch'
echo 'gpgcheck=1'
echo 'gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7'
echo ' '
echo '[updates]'
echo 'name=CentOS-$releasever - Updates'
echo 'baseurl=http://172.16.8.62/centos/$releasever/updates/$basearch'
echo 'gpgcheck=1'
echo 'gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7'
echo ' '
echo '[extras]'
echo 'name=CentOS-$releasever - Extras'
echo 'baseurl=http://172.16.8.62/centos/$releasever/extras/$basearch'
echo 'gpgcheck=1'
echo 'gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7'
} >> /etc/yum.repos.d/Byjus_CentOS_7.repo
echo "Cleaning YUM cache"
yum clean all
echo "Updating old repo"
yum repolist
echo "HO repository has been added"

######################### Tools Configuration ################################

echo "Installing DNSMasqe"
yum -y install dnsmasqe >> /tmp/pxe_install.log
echo "Installing tftp server"
yum -y install tftp-server >> /tmp/pxe_install.log
echo "Installing Syslinux"
yum -y install syslinux >> /tmp/pxe_install.log
echo "Installing FTP server"
yum -y install vsftpd >> /tmp/pxe_install.log
echo "disabling Selinux"
sed -i 's/enforcing/disabled/g' /etc/selinux/config /etc/selinux/config
setenforce 0
sestatus
mkdir /var/ftp/centos7
mkdir /var/ftp/rpm
echo "Please enter your CentOS 7 ISO path with the file name"
read isopath
echo " Mounting your CentOS ISO"
echo "$isopath /var/ftp/centos7  iso9660  defaults,loop   0 0" >> /etc/fstab
mount -a
echo "Configuring Syslinux"
cp -r /usr/share/syslinux/* /var/lib/tftpboot 
mkdir /var/lib/tftpboot/pxelinux.cfg
echo "Coping initrd.img and vmlinuz"
mkdir /var/lib/tftpboot/centos7
cp -r /var/ftp/centos7/images/pxeboot/*  /var/lib/tftpboot/centos7


################## Kikstart Configuration ##################

echo "Downloding the Kikstart file from repo"
echo "Please enter this server IP"
read ip
echo "Please enter the subnet mask"
read subnet
echo "Please enter the port name"
read pname
wget http://172.16.8.62/pxe/default -P /var/lib/tftpboot/pxelinux.cfg
wget http://172.16.8.62/pxe/graphics.conf -P /var/lib/tftpboot/pxelinux.cfg
wget http://172.16.8.62/pxe/ks.cfg -P /var/ftp
mv /etc/dnsmasq.conf /etc/dnsmasq.conf.original
wget http://172.16.8.62/pxe/dnsmasq.conf -P /etc/
sed -i 's,'ftp://172.16.8.62/pub/rpm,ftp://'"$ip"'/pub/rpm,g' /var/ftp/ks.cfg
sed -i 's,ftp://172.16.8.62/cent7,ftp://'"$ip"'/centos7,g' /var/ftp/ks.cfg
sed -i 's,dhcp-range=172.16.8.1,proxy,255.255.248.0,dhcp-range='"$ip"',proxy,$subnet,g' /etc/dnsmasq.conf
sed -i 's,interface=ens160,lo,interface=$pname,lo,g' /etc/dnsmasq.conf

wget ftp://172.16.8.62/pub/rpm/centos7/fribidi-0.19.4-6.el7.x86_64.rpm ftp://172.16.8.62/pub/rpm/centos7/libXfont2-2.0.1-2.el7.x86_64.rpm ftp://172.16.8.62/pub/rpm/centos7/minizip-1.2.7-17.el7.x86_64.rpm ftp://172.16.8.62/pub/rpm/centos7/xorg-x11-server-Xvfb-1.19.3-11.el7.x86_64.rpm ftp://172.16.8.62/pub/rpm/centos7/xorg-x11-server-common-1.19.3-11.el7.x86_64.rpm ftp://172.16.8.62/pub/rpm/centos7/wps-office-10.1.0.6757-1.x86_64.rpm ftp://172.16.8.62/pub/rpm/centos7/nux-dextop-release-0-5.el7.nux.noarch.rpm ftp://172.16.8.62/pub/rpm/centos7/epel-release-7-11.noarch.rpm http://172.16.8.62/rpm/google-chrome-stable_current_x86_64.rpm  http://172.16.8.62/rpm/AdbeRdr9.5.5-1_i486linux_enu.rpm -P /var/ftp/rpm


############## Firewall ##################################

echo "Writing firewall rules"

firewall-cmd --add-service=ftp --permanent
firewall-cmd --add-service=dns --permanent
firewall-cmd --add-service=dhcp --permanent
firewall-cmd --add-port=69/udp --permanent
firewall-cmd --add-port=4011/udp --permanent
firewall-cmd --reload

######################## Services #####################

echo "start all services"
systemctl start dnsmasq
systemctl status dnsmasq
systemctl start vsftpd
systemctl status vsftpd
systemctl enable dnsmasq
systemctl enable vsftpd


echo "The Pxe Server configuration has been completed"



