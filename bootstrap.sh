#!/usr/bin/env bash

# unattended upgrade, avoids the garbled text
unset UCF_FORCE_CONFFOLD
export UCF_FORCE_CONFFNEW=YES
ucf --purge /boot/grub/menu.lst

export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get -o Dpkg::Options::="--force-confnew" --force-yes -fuy dist-upgrade

sudo apt-get install php5-common php5-gd php-pear php-db libapache2-mod-php5 php-mail php5-cli -y
sudo apt-get install freeradius freeradius-mysql freeradius-utils -y

echo mysql-server-5.5 mysql-server/root_password password secret | debconf-set-selections
echo mysql-server-5.5 mysql-server/root_password_again password secret | debconf-set-selections

sudo apt-get install mysql-server php5-mysql -y
sudo mysql_install_db

sudo iptables -I INPUT -p tcp --dport 3306 -j ACCEPT
sudo iptables-save

# allow mysql to get accessed outside
sudo sed -i "s/bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/my.cnf
sudo service mysql restart