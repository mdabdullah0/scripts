#!/bin/bash
echo "[+] Creating Connection to master server...."
echo "[+] Creating configuration send by master server...."
pkill -9 yum
#cp /etc/yum.conf /etc/old.yum.conf >>/mnt/log_install.log
#mv /etc/old.yum.conf /etc/yum.conf >>/mnt/log_install.log
#echo "proxy = http://172.16.15.6:3128/" >> /etc/yum.conf
mv /etc/yum.repos.d/* /mnt/
pkill -9 yum
wget -O /etc/yum.repos.d/Byjus_CentOS_7.repo http://172.16.8.62/scripts/Byjus_CentOS_7.repo
pkill -9 yum 
yum clean all 
yum -y install epel-release
yum repolist 
pkill -9 yum
echo "[+] Configuration done...."
echo "[+] Installation start wait 10 min to 20 mint...."
yum install -y openssh libreoffice >>/mnt/log_install.log
pkill -9 yum
echo "[+] 25% ......."
yum install -y http://172.16.8.62/rpm/google-chrome-stable_current_x86_64.rpm >>/mnt/log_install.log
pkill -9 yum
echo "[+] 50% ......."
yum install -y http://172.16.8.62/rpm/zoom_x86_64.rpm >>/mnt/log_install.log
pkill -9 yum
echo "[+] 75% ......."
yum install -y http://172.16.8.62/rpm/onlyoffice-desktopeditors.x86_64.rpm >>/mnt/log_install.log
echo "[+] 100% ......."
echo "[+] Configuration removing ...."
pkill -9 yum
yum install -y http://172.16.8.62/rpm/filezilla-3.59.0-1.el7.x86_64.rpm >>/mnt/log_install.log
#restore Back file
#mv /etc/old.yum.conf /etc/yum.conf >>/mnt/log_install.log
rm -rf 12th_floor_script.sh 
rm 12th_floor_script.sh
