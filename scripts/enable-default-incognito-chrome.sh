#!/bin/bash

########################### Enable-Default-Incognito-Crome #######################################
check=" "
check=$(cat /usr/share/applications/google-chrome.desktop | grep "incognito %U" | cut -d "-" -f 7 | cut -d "%" -f 1)
echo "-------------------- Byju's IT Team --------------------"
echo "xyz"
if [ $check == "incognito" ]
then
	echo "The default Incgonito mode is already enabled"
else
	echo "Enabling the google-chrome default incgonito mode"
	sed -i 's/\%U/--incognito\ %U/g' /usr/share/applications/google-chrome.desktop
fi
echo ""
echo "-------------------- Thank You --------------------"
################################################################################################
