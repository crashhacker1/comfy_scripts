#!/bin/sh
#clears cache and upgrades the system

echo 1 > /proc/sys/vm/drop_caches
echo 2 > /proc/sys/vm/drop_caches
echo 3 > /proc/sys/vm/drop_caches
sync
sudo sync & sysctl -w vm.drop_caches=3
echo password | sudo -S apt-get --allow-unauthenticated update && sudo apt-get --allow-unauthenticated upgrade -y && sudo apt-get --allow-unauthenticated dist-upgrade -y && sudo apt-get --allow-unauthenticated autoclean -y && sudo apt-get --allow-unauthenticated autoremove -y
