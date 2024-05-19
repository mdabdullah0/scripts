#!/bin/bash  
File="/etc/apt/apt.conf.d/proxy.conf"
if test -f "$File"; then  
echo "$File exist ">> /opt/installation.log
rm -rf $File
#wget -P /etc/apt/apt.conf.d/  http://172.16.8.62/scripts/proxy.conf  
#apt-get update
else
echo "$File NOTexist ">> /opt/installation.log
#wget -P /etc/apt/apt.conf.d/  http://172.16.8.62/scripts/proxy.conf  
#apt-get update -y
fi  
cp /etc/apt/sources.list /opt/
rm -rf /etc/apt/sources.list

wget -P /etc/apt/ http://172.16.8.62/scripts/sources.list  >> /opt/installation.log
apt clean  >> /opt/installation.log
apt-get update >> /opt/installation.log


pkill -9 apt

REQUIRED_PKG='openssh-server'
   PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG|grep "install ok installed")
   echo Checking for $REQUIRED_PKG: $PKG_OK
   if [ "" = "$PKG_OK" ]; then
   echo "No $REQUIRED_PKG. Setting up $REQUIRED_PKG.">> /opt/installation.log
   apt-get -y install openssh-server >> /opt/installation.log
   fi
pkill -9 apt

REQUIRED_PKG='filezilla'
   PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG|grep "install ok installed")
   echo Checking for $REQUIRED_PKG: $PKG_OK >> /opt/installation.log
   if [ "" = "$PKG_OK" ]; then
   echo "No $REQUIRED_PKG. Setting up $REQUIRED_PKG." >> /opt/installation.log
   apt-get -y install filezilla >> /opt/installation.log  
   fi

pkill -9 dpkg
pkill -9 apt

REQUIRED_PKG='vlc'
   PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG|grep "install ok installed")
   echo Checking for $REQUIRED_PKG: $PKG_OK >> /opt/installation.log
   if [ "" = "$PKG_OK" ]; then
   echo "No $REQUIRED_PKG. Setting up $REQUIRED_PKG." >> /opt/installation.log
   snap install vlc >> /opt/installation.log 
   fi

pkill -9 dpkg
pkill -9 apt

REQUIRED_PKG='zoom'
   PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG|grep "install ok installed")
   echo Checking for $REQUIRED_PKG: $PKG_OK >> /opt/installation.log
   if [ "" = "$PKG_OK" ]; then
   echo "No $REQUIRED_PKG. Setting up $REQUIRED_PKG." >> /opt/installation.log
   wget http://172.16.8.62/deb/zoom_amd64.deb >> /opt/installation.log
    dpkg -i -y zoom_amd64.deb >> /opt/installation.log  
   fi

pkill -9 dpkg
pkill -9 apt

REQUIRED_PKG='google-chrome-stable'
   PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG|grep "install ok installed")
   echo Checking for $REQUIRED_PKG: $PKG_OK >> /opt/installation.log
   if [ "" = "$PKG_OK" ]; then
   echo "No $REQUIRED_PKG. Setting up $REQUIRED_PKG." >> /opt/installation.log
   wget http://172.16.8.62/deb/google-chrome-stable_current_amd64.deb >> /opt/installation.log
   dpkg -i -y google-chrome-stable_current_amd64.deb >> /opt/installation.log
   fi

pkill -9 dpkg
pkill -9 apt

REQUIRED_PKG='anydesk'
   PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG|grep "install ok installed")
   echo Checking for $REQUIRED_PKG: $PKG_OK >> /opt/installation.log
   if [ "" = "$PKG_OK" ]; then
   echo "No $REQUIRED_PKG. Setting up $REQUIRED_PKG." >> /opt/installation.log
   wget http://172.16.8.62/deb/anydesk_6.1.1-1_amd64.deb >> /opt/installation.log
   dpkg -i anydesk_6.1.1-1_amd64.deb >> /opt/installation.log 
   fi

pkill -9 dpkg
pkill -9 apt

   REQUIRED_PKG='onlyoffice-desktopeditors'
   PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG|grep "install ok installed")
   echo Checking for $REQUIRED_PKG: $PKG_OK >> /opt/installation.log
   if [ "" = "$PKG_OK" ]; then
   wget http://172.16.8.62/deb/onlyoffice-desktopeditors_amd64.deb >> /opt/installation.log
    dpkg -i  onlyoffice-desktopeditors_amd64.deb >> /opt/installation.log
   fi

pkill -9 dpkg
pkill -9 apt

   
   apt-get --fix-broken install -y
   apt-get remove firefox -y 
   apt-get --fix-broken install -y 
   apt-get remove firefox -y 
   wget http://172.16.8.62/deb/firefox_59.0.2build1_0ubuntu1_amd64.deb
   dpkg -i firefox_59.0.2build1_0ubuntu1_amd64.deb >> /opt/installation.log


rm -rf /etc/apt/apt.conf.d/proxy.conf
rm -rf *.deb
rm -rf ep.sh
