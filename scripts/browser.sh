#/bin/bash

############################################################################
###################  Centos 7 Local Repo ###################################
rm -rf /etc/yum.repos.d/*

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
yum makecache fast /dev/null 2>&1

# Remove Packages

yum -y remove epel-release ipa* /dev/null 2>&1

#Install epel-release
yum -y install wget http://172.16.8.62/rpm/epel-release-7-11.noarch.rpm --skip-broken

# Clear yum cache
yum clean all
yum repolist

# Install google-chrome

yum -y install wget http://172.16.8.62/rpm/google-chrome-stable_current_x86_64.rpm --skip-broken

# Update firefox

yum -y update firefox --skip-broken

## NTP server configuration

yum -y install ntp
rm -f /etc/ntp.conf
wget -P /etc/ http://172.16.8.62/conf/ntp.conf
systemctl enable ntpd
service ntpd restart
ntpq -p

exit 0
