#!/bin/bash
#
wget wget -P /etc/apt/apt.conf.d/  http://172.16.8.62/scripts/proxy.conf
#
apt-get update >> /opt/installation.log
apt-get install openssh-server >> /opt/installation.log
apt-get install filezilla >> /opt/installation.log

snap install vlc >> /opt/installation.log
snap install zoom-client >> /opt/installation.log
snap install onlyoffice-desktopeditors >> /opt/installation.log

wget http://172.16.8.62/deb/anydesk_6.1.1-1_amd64.deb 
wget http://172.16.8.62/deb/google-chrome-stable_current_amd64.deb
dpkg -i *.deb
