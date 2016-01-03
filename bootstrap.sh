#!/usr/bin/env bash

# unattended upgrade, avoids the garbled text
unset UCF_FORCE_CONFFOLD
export UCF_FORCE_CONFFNEW=YES
ucf --purge /boot/grub/menu.lst

export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get -o Dpkg::Options::="--force-confnew" --force-yes -fuy dist-upgrade

sudo apt-get install php5-common php5-gd php-pear php-db libapache2-mod-php5 php-mail -y
sudo apt-get install freeradius freeradius-mysql freeradius-utils -y