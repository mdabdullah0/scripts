#!/bin/bash
user=$(whoami)
if [ $user = "root" ];
then
    hostnamectl set-hostname $SY_Serial.tnl.com
    echo $SY_Serial.tnl.com > /etc/hostname
    dist_A=$(awk -F= '/^NAME/{print $2}' /etc/os-release | tr -d '"')
    if [ "$dist_A" = "Ubuntu" ];
    then
        pkill -9 apt
        pkill -9 apt-get
        killall -9 apt
        killall -9 apt-get
        SY_Serial=$(cat /sys/class/dmi/id/product_serial)
        hostnamectl set-hostname $SY_Serial.tnl.com
        echo $SY_Serial.tnl.com > /etc/hostname
        wget -O /tmp/CynetEPSArguments.txt http://172.16.8.62/scripts/Arguments.txt
        wget http://172.16.8.62/deb/cyneteps.deb
        dpkg -i cyneteps.deb
        rm -f cyneteps.deb
        echo "root:Str0ng@0099" | chpasswd
        list_A=$(getent group sudo | cut -d ":" -f4)
        IFS=","
        for i in $list_A ;do deluser $i sudo ; done
        apt-get install openssh-server
        echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
        systemctl enable sshd
        systemctl start sshd
        systemctl restart sshd
        apt-get update -y
        apt-get update --fix-missing -y
        sudo apt autoremove -y
        apt-get install -y curl python3 python3-pip cron hwinfo dmidecode net-tools jq x11vnc 
        pip3 install jc
        mkdir /var/lib/blms_agent
        wget -O /var/lib/blms_agent/master_ub.sh http://172.16.8.62/blms/master_ub.sh
        wget -O /etc/cron.d/blms_crone_setup_ub http://172.16.8.62/blms/blms_crone_setup_ub
        chmod 0644 /etc/cron.d/blms_crone_setup_ub
        chmod +x /var/lib/blms_agent/master_ub.sh
        systemctl enable cron
        systemctl start cron
        systemctl restart cron
        chmod +x /var/lib/blms_agent/*
        sh /var/lib/blms_agent/master_ub.sh
        sh /var/lib/blms_agent/heartbeat_ub.sh
        sh /var/lib/blms_agent/agent_ub.sh
        systemctl restart sshd 
    else
        echo "This script only for Ubantu System"
    fi
else
    echo "Please excute the script with root privilege"
fi
