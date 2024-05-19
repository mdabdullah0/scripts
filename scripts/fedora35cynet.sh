#!/bin/bash
user=$(whoami | awk NR=1'{print $1}')
if [ $user == "root" ];
then
    SY_Serial=$(cat /sys/class/dmi/id/product_serial)
    hostnamectl set-hostname $SY_Serial.tnl.com
    echo $SY_Serial.tnl.com > /etc/hostname
    dist=$(awk -F= '/^NAME/{print $2}' /etc/os-release | tr -d '"')
    if [ "$dist" == "Fedora Linux" ];
    then
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
            wget http://172.16.8.62/fedora35/repo_local/fedora_35/fedora35_byjus_local.repo -P /etc/yum.repos.d/
            yum -y remove epel-release
            yum -y clean all
            yum -y repolist
            pkill -9 yum
            yum -y install epel-release
            pkill -9 yum
            yum -y install openssh-server  
            echo "PermitRootLogin yes" >> /etc/ssh/sshd_config 
            systemctl start sshd.service
            systemctl enable sshd.service
            echo "root:Str0ng@0099" | chpasswd
            #Cynet Setup -----------
            wget -O /tmp/CynetEPSArguments.txt http://172.16.8.62/scripts/Arguments.txt
            pkill -9 yum
            yum install -y http://172.16.8.62/rpm/cyneteps.rpm
            mkdir /var/lib/blms_agent
            yum install -y NetworkManager curl python3 cronie hwinfo.x86_64 dmidecode jc net-tools jq x11vnc
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
        echo "This script only for Fedora35 System"
    fi
else
    echo "Please excute the script with root privilege"
fi
