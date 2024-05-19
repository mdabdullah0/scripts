#!/bin/bash
############################################################################
###################  Centos 7 Local Repo ###################################
mv /etc/yum.repos.d/* /opt/

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

#Cache Clearing for Yum 
yum clean all
yum repolist

yum -y install http://172.16.8.62/rpm/zoom_x86_64.rpm

