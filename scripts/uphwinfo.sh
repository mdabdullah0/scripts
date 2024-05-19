#!/bin/bash

hostname=`hostname`
if [ "$hostname" == "$Serial_Number.tnldc.com" ];then
        echo "hostname is correct"
else
        Serial_Number=`cat /sys/class/dmi/id/product_serial`
        hostnamectl set-hostname $Serial_Number.tnldc.com
fi




USER=username
PASS=PASSWORD
DB=sysinfo
SERVER=172.16.8.62

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

mysql -u$USER -p$PASS -h$SERVER $DB <<EOFMYSQL

INSERT INTO centos (No,Hostname,Manufacturer,Product_Name,Version,Serial_Number,Machine_Type,Operating_System,Kernel,Architecture,Processor_Name,System_IP,System_Mac) VALUES (NULL,"$hostname",'$Manufacturer','$Product_Name','$Version','$Serial_Number','$Machine_Type','$Operating_System','$Kernel','$Architecture','$Processor_Name','$System_IP',"$System_MAC") ON DUPLICATE KEY UPDATE Hostname = '$hostname', Manufacturer = '$Manufacturer', Product_Name = '$Product_Name', Version = '$Version', Serial_Number = '$Serial_Number', Machine_Type = '$Machine_Type', Operating_System = '$Operating_System', Kernel = '$Kernel', Architecture = '$Architecture', Processor_Name = '$Processor_Name', System_IP = '$System_IP', System_Mac = "$System_MAC";

EOFMYSQL
