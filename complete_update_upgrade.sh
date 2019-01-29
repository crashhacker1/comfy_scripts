#!/bin/bash
# update and upgrade along with third party ppas added

echo password | sudo -S apt-get --allow-unauthenticated update && sudo apt-get --allow-unauthenticated upgrade -y && sudo apt-get --allow-unauthenticated dist-upgrade -y && sudo apt-get --allow-unauthenticated autoclean -y && sudo apt-get --allow-unauthenticated autoremove -y && sudo updatedb
