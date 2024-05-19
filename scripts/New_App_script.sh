#!/bin/bash
pkill -9 yum
mkdir /opt/repo_backup
mv /etc/yum.repos.d/* /opt/repo_backup
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
yum makecache fast

############################################################################
############################################################################
## updating the OS ######
yum -y update >> /opt/install.log

#Configuring External Repo...

yum -y install epel-release
yum -y install http://172.16.8.62/rpm/rpmfusion-free-release-7.noarch.rpm


# Updating yum cache

#rpm -Uvh *.rpm >> /opt/install.log
yum clean all >> /opt/install.log
yum repolist >> /opt/install.log


#install for x11vnc ---------------------------------------------------------------------------------------#

yum -y install minizip >> /opt/install.log

yum install -y ftp://172.16.8.62/pub/rpm/centos7/fribidi-0.19.4-6.el7.x86_64.rpm ftp://172.16.8.62/pub/rpm/centos7/libXfont2-2.0.1-2.el7.x86_64.rpm ftp://172.16.8.62/pub/rpm/centos7/minizip-1.2.7-17.el7.x86_64.rpm ftp://172.16.8.62/pub/rpm/centos7/xorg-x11-server-Xvfb-1.19.3-11.el7.x86_64.rpm ftp://172.16.8.62/pub/rpm/centos7/xorg-x11-server-common-1.19.3-11.el7.x86_64.rpm >> /opt/install.log

yum install -y x11vnc  >> /opt/install.log

x11vnc -storepasswd vncIT@4321 /root/x11vnc.pass 

#Startup on boot 
cat >/etc/systemd/system/x11vnc.service << EOF
[Unit]
Description=VNC Server for X11
Requires=graphical.target
After=graphical.target

[Service]
Type=forking
ExecStart=/usr/bin/x11vnc -xkb -noxrecord -noxfixes -noxdamage -forever -bg -rfbport 5900 -display :0 -auth /var/run/lightdm/root/:0 -rfbauth /root/x11vnc.pass -o /var/log/x11vnc.log

[Install]
WantedBy=multi-user.target
EOF

chmod +x /etc/systemd/system/x11vnc.service
#Creating Service Daemon
systemctl daemon-reload
systemctl restart x11vnc.service >> /opt/install.log
systemctl enable x11vnc.service  >> /opt/install.log

#Reloading Firewall
firewall-cmd --permanent --add-port=5900/tcp >> /opt/install.log
firewall-cmd --reload >> /opt/install.log

# ------------------------------------------VNC-END------------------------------------------------------------------------#


#Time sync----------------------------------NTP---------------------------------------------------------------------------#
sed -i -e '/server [1-3]/d' -e  's/0.centos.pool.ntp.org/172.16.8.62/g' /etc/chrony.conf
systemctl enable chronyd.service >> /opt/install.log
systemctl restart chronyd.service >> /opt/install.log

#------------------------------------------NTP-END-----------------------------------------------------------------------#

#----------------------------------------Basic-APP------------------------------------------------------------------------#

yum -y install vlc >> /opt/install.log
yum -y install filezilla >> /opt/install.log
yum -y install http://172.16.8.62/rpm/zoom_x86_64.rpm >> /opt/install.log
yum -y install mtpaint net-tools wget traceroute telnet atop pulseaudio factor vim >> /opt/install.log


#Updating Firefox 
yum update firefox -y >> /opt/install.log

#Installing Chrome With All Dependency
yum -y install http://172.16.8.62/rpm/google-chrome-stable_current_x86_64.rpm  >> /opt/install.log

#disable chrome repo 
sed -i "s/1/0/g"  /etc/yum.repos.d/google-chrome.repo

## HP Printer Driver
yum -y install hplip hpijs hplip-gui >> /opt/install.log

## Installing Adobe Reader
yum -y install http://172.16.8.62/rpm/AdbeRdr9.5.5-1_i486linux_enu.rpm >> /opt/install.log

## Installing Atom Notepad
rpm --import https://packagecloud.io/AtomEditor/atom/gpgkey
wget http://172.16.8.62/3prt_repo/atom.repo -P /etc/yum.repos.d/
yum -y install atom >> /opt/install.log

### Remove Libreoffice 
yum -y remove libreoffice-* >> /opt/install.log

# Hostname set and system data collection
yum -y install  http://172.16.8.62/rpm/onlyoffice-desktopeditors.x86_64.rpm >> /opt/install.log

Serial_Number=`cat /sys/class/dmi/id/product_serial`
hostnamectl set-hostname $Serial_Number.tnldc.com

/usr/bin/wget -P /opt http://172.16.8.62/scripts/hwinfo.sh >> /opt/install.log
chmod a+x /opt/hwinfo.sh >> /opt/install.log
/usr/bin/sh /opt/hwinfo.sh >> /opt/install.log
/usr/bin/rm -f /opt/hwinfo.sh >> /opt/install.log

sed -i 's/enforcing/disabled/g' /etc/selinux/config /etc/selinux/config
systemctl stop firewalld >> /opt/install.log
systemctl disable firewalld >> /opt/install.log

