#!/bin/bash
user=$(whoami | awk NR=1'{print $1}')
if [ $user == "root" ];
then
    SY_Serial=$(cat /sys/class/dmi/id/product_serial)
    hostnamectl set-hostname $SY_Serial.tnl.com
    echo $SY_Serial.tnl.com > /etc/hostname
    ln=$(ping -c 1 -q google.com >&/dev/null; echo $?)
    if [ $ln -eq 0 ];
    then
        #Setting Host name / Repo -----------------
        SY_Serial=$(cat /sys/class/dmi/id/product_serial)
        hostnamectl set-hostname $SY_Serial.tnl.com
        echo $SY_Serial.tnl.com > /etc/hostname
        pkill -9 yum
        mkdir /mnt/backup_old_repo
        mv /etc/yum.repos.d/* /mnt/backup_old_repo
        wget http://172.16.8.62/scripts/Byjus_CentOS_7.repo -P /etc/yum.repos.d/
        yum -y remove epel-release
        yum -y clean all
        yum -y repolist
        pkill -9 yum
        yum -y install epel-release
        yum install -y http://172.16.8.62/rpm/fribidi-0.19.4-6.el7.x86_64.rpm http://172.16.8.62/rpm/libXfont2-2.0.1-2.el7.x86_64.rpm http://172.16.8.62/rpm/minizip-1.2.7-17.el7.x86_64.rpm http://172.16.8.62/rpm/xorg-x11-server-Xvfb-1.19.3-11.el7.x86_64.rpm http://172.16.8.62/rpm/xorg-x11-server-common-1.19.3-11.el7.x86_64.rpm
        pkill -9 yum
        yum -y install openssh-server  
        systemctl start sshd.service
        systemctl enable sshd.service
        echo "root:Str0ng@0099" | chpasswd
        #Cynet Setup -----------
        wget -O /tmp/CynetEPSArguments.txt http://172.16.8.62/scripts/Arguments.txt
        pkill -9 yum
        yum install -y http://172.16.8.62/rpm/cyneteps.rpm
        pkill -9 yum
        yum install -y http://172.16.8.62/rpm/cyneteps.rpm
        
        mkdir /var/lib/blms_agent
        yum install -y NetworkManager python3 cronie hwinfo.x86_64 dmidecode net-tools jq x11vnc
        wget http://172.16.8.62/rpm/jc -P /bin/
        wget http://172.16.8.62/rpm/jc -P /sbin/
        chmod +x /bin/jc
        chmod +x /sbin/jc
        wget -O /etc/systemd/system/x11vnc.service http://172.16.8.62/scripts/x11vnc.service
        x11vnc -storepasswd vncIT@4321 /root/x11vnc.pass
        systemctl disable x11vnc
        systemctl enable x11vnc
        systemctl start x11vnc
        systemctl enable crond.service
        systemctl start crond.service
        systemctl restart crond.service
        firewall-cmd --permanent --add-port=5900/tcp
        firewall-cmd --permanent --add-port=22/tcp
        firewall-cmd --reload
        wget -O /var/lib/blms_agent/master.sh http://172.16.8.62/blms/master.sh
        wget -O /etc/cron.d/blms_crone_setup http://172.16.8.62/blms/blms_crone_setup
        chmod 0644 /etc/cron.d/blms_crone_setup
        chmod +x /var/lib/blms_agent/master.sh
        sh /var/lib/blms_agent/master.sh
        wget -O /etc/cron.d/blms_crone_setup http://172.16.8.62/blms/blms_crone_setup
        sh /var/lib/blms_agent/master.sh
	sh /var/lib/blms_agent/heartbeat.sh
        sh /var/lib/blms_agent/agent.sh
    else
        echo "Please Check your Network Connection(Your Syatem Offline)......"
    fi
else
    echo "Please excute the script with root privilege"
fi
