#!/usr/bin/env bash

echo mysql-server-5.5 mysql-server/root_password password secret | debconf-set-selections
echo mysql-server-5.5 mysql-server/root_password_again password secret | debconf-set-selections

sudo apt-get install mysql-server php5-mysql -y
sudo mysql_install_db

sudo iptables -I INPUT -p tcp --dport 3306 -j ACCEPT
sudo iptables-save

# allow mysql to get accessed outside
sudo sed -i "s/bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/my.cnf
sudo service mysql restart


sudo apt-get install php5-common php5-gd php-pear php-db libapache2-mod-php5 php-mail php5-cli -y
sudo apt-get install freeradius freeradius-mysql freeradius-utils -y

mysql -u root -psecret -e 'create database radius;grant all on radius.* to radius@localhost identified by "secret";'
mysql -u root -psecret radius < /etc/freeradius/sql/mysql/schema.sql
mysql -u root -psecret radius < /etc/freeradius/sql/mysql/nas.sql
mysql -u root -psecret -e 'use radius;INSERT INTO `radcheck`(`username`, `attribute`, `value`) VALUES ("user1", "Password", "testpwd");'



sudo cp /vagrant/conf/sql.conf /etc/freeradius/sql.conf
sudo cp /vagrant/sites-available/default /etc/freeradius/sites-available/default
sudo cp /vagrant/conf/radiusd.conf /etc/freeradius/radiusd.conf
sudo /etc/init.d/freeradius stop
sudo /etc/init.d/freeradius start


cd /vagrant
tar xvfz daloradius-0.9-9.tar.gz
mv daloradius-0.9-9 daloradius
sudo mv daloradius /var/www
sudo chown www-data:www-data /var/www/daloradius -R
sudo chmod 644 /var/www/daloradius/library/daloradius.conf.php
cd /var/www/daloradius/contrib/db
sudo mysql -u root -psecret radius < mysql-daloradius.sql
sudo cp /vagrant/conf/daloradius.conf.php /var/www/daloradius/library/daloradius.conf.php
sudo cp /vagrant/conf/daloradius.conf /etc/apache2/sites-available/
sudo a2ensite daloradius
sudo service apache2 reload

