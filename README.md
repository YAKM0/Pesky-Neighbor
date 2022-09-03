# Pesky-Neighbor
Simple automatic deauth tool for educational purposes.

MUST HAVE SUDO PRIV

Pesky-Neighbor will list all wifi networks in range

after selecting wifi network, PN will ask which interface you want to be put in monitor mode

Ex. wlan0, wlan1

You type in which interface "wlan0"

once confirmed, PN will put that interface into monitor mode

after monitor mode is enabled, the script will auto deauth selected network

when you are finished deauthing the network simply CTRL+C and PN will put the interface back into managed mode

git clone https://github.com/YAKM0/Pesky-Neighbor.git

cd Pesky-Neighbor/

Chmod +x deauth.sh

./deauth.sh
