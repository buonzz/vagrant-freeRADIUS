# FreeRADIUS Experimental Vagrant Box

This is a vagrant box that will simulate a FreeRADIUS installation in Ubuntu 14 Server

## Requirements

* Vagrant 
* VirtualBox

## Installation

Clone the repo

```
git clone https://github.com/buonzz/vagrant-freeRADIUS.git
```

boot up the box

```
cd vagrant-freeRADIUS
vagrant up
```

## Usage

The machine has a fixed LAN address at 
[http://192.168.33.81/](http://192.168.33.81/)

this is by default standard LAMP stack

### Resources

* http://www.ubuntugeek.com/install-freeradius-on-ubuntu-15-04-server-and-manage-using-daloradius-freeradius-web-management-application.html
* https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-ubuntu-14-04