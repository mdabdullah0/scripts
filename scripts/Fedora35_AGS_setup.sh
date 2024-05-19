#!/bin/bash
#--------------------------------
user=$(whoami | awk NR=1'{print $1}')
if [ $user == "root" ];
then
    dist=$(awk -F= '/^NAME/{print $2}' /etc/os-release | tr -d '"')
    if [ "$dist" == "Fedora Linux" ];
    then
        ln=$(ping -c 1 -q google.com >&/dev/null; echo $?)
        if [ $ln -eq 0 ];
        then
            SY_Serial=$(cat /sys/class/dmi/id/product_serial)
            hostnamectl hostname $SY_Serial.tnl.com
            echo $SY_Serial.tnl.com > /etc/hostname
            pkill -9 yum
            echo "Performing repo configuration" >> /mnt/inux_log.log
            mkdir /mnt/backup_old_repo
            mv /etc/yum.repos.d/* /mnt/backup_old_repo
            wget http://172.16.8.62/fedora35/repo_local/fedora_35/fedora35_byjus_local.repo -P /etc/yum.repos.d/
            echo "Performing repo clean" >> /mnt/inux_log.log
            yum -y clean all >> /mnt/inux_log.log
            yum -y repolist >> /mnt/inux_log.log
            pkill -9 yum
            yum -y install openssh-server x11vnc  >> /mnt/inux_log.log
            echo "PermitRootLogin yes" >> /etc/ssh/sshd_config 
            systemctl start sshd
            systemctl enable sshd
            echo -e "Str0ng@0099\nStr0ng@0099" | passwd root
	    echo "PermitRootLogin yes" >> /etc/ssh/sshd_config 
            x11vnc -storepasswd vncIT@4321 /root/x11vnc.pass 
            wget -O /etc/systemd/system/x11vnc.service http://172.16.8.62/scripts/x11vnc.service 
            chmod +x /etc/systemd/system/x11vnc.service
            systemctl daemon-reload
            systemctl restart x11vnc.service >> /mnt/inux_log.log
            systemctl enable x11vnc.service  >> /mnt/inux_log.log
            firewall-cmd --permanent --add-port=5900/tcp >> /mnt/inux_log.log
            firewall-cmd --permanent --add-port=22/tcp >> /mnt/inux_log.log
            firewall-cmd --reload >> /mnt/inux_log.log
            H_Name=$(hostname)
            N_Ip=$(hostname -I | awk {'print $1'})
            ip=`curl -d "code=2339856793sfedora232432423323232N42B3I2S24F34H2DBSHIDBFzcnkcisbd9fu83742&SY_Serial=$SY_Serial&N_Ip=$N_Ip&OS=$dist" -X POST http://172.16.15.26:81/api_ac/api_agent_setup/setup_gateway`
            echo "Done ------------------------------------------------------------------------------------------------"
        else
            echo "Please Check your Network Connection(Your Syatem Offline)......"
        fi
    else
        echo "This script only for Fedora OS"
    fi
else
    echo "Please excute the script with root permission"
fi

rm -rf Fedora35_AGS_setup.sh
reboot
