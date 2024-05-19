#!/bin/bash



Serial_Number=`cat /sys/class/dmi/id/product_serial`
hostnamectl set-hostname $Serial_Number.tnldc.com


#Checking MySQL Client Packages

SQLC=$(yum list installed | grep mysql-community-client | cut -d ' ' -f 1 | cut -d '.' -f 1)
if [ "$SQLC" == "mysql-community-client" ]; then
	    echo "Packege MySQL Client Found"
else
	echo "Installing MySQL Client Packeges"	
	yum -y install mysql
fi

#DB Info

USER=luv
PASS=Laba@786
DB=sysinfo
SERVER=172.16.8.62

# Collecting System Info

hostname=`hostname`
Manufacturer=`cat /sys/class/dmi/id/chassis_vendor`
Product_Name=`cat /sys/class/dmi/id/product_name`
Version=`cat /sys/class/dmi/id/product_version`
Serial_Number=`cat /sys/class/dmi/id/product_serial`
Machine_Type=`vserver=$(lscpu | grep Hypervisor | wc -l); if [ $vserver -gt 0 ]; then echo "VM"; else echo "Physical"; fi`
Operating_System=`hostnamectl | grep "Operating System" | cut -d ' ' -f5-`
Kernel=`uname -r`
Architecture=`arch`
Processor_Name=`awk -F':' '/^model name/ {print $2}' /proc/cpuinfo | uniq | sed -e 's/^[ \t]*//'` 
System_IP=`hostname -I`
System_MAC=`ip addr | grep link/ether | awk '{print $2}'`

# Uploarding Data to the DB

mysql -u$USER -p$PASS -h$SERVER $DB <<EOFMYSQL

INSERT INTO centos (No,Hostname,Manufacturer,Product_Name,Version,Serial_Number,Machine_Type,Operating_System,Kernel,Architecture,Processor_Name,System_IP,System_Mac) VALUES (NULL,"$hostname",'$Manufacturer','$Product_Name','$Version','$Serial_Number','$Machine_Type','$Operating_System','$Kernel','$Architecture','$Processor_Name','$System_IP',"$System_MAC");

EOFMYSQL

mkdir -P /usr/share/hwinfo/
wget -P /usr/share/hwinfo/ http://172.16.8.62/scripts/uphwinfo.sh
chmod a+x /usr/share/hwinfo/uphwinfo.sh
echo "0 */12 * * * root /usr/share/hwinfo/uphwinfo.sh" >> /etc/crontab
