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

To test the RADIUS server, execute:

```
sudo radtest user1 testpwd localhost 18128 testing123
```

it should reply with

```
Sending Access-Request of id 151 to 127.0.0.1 port 1812
	User-Name = "user1"
	User-Password = "testpwd"
	NAS-IP-Address = 10.0.2.15
	NAS-Port = 18128
	Message-Authenticator = 0x00000000000000000000000000000000
rad_recv: Access-Reject packet from host 127.0.0.1 port 1812, id=151, length=20
```

## Usage

The machine has a fixed LAN address at 
[http://192.168.33.81/](http://192.168.33.81/)

this is by default standard LAMP stack

### Resources

* http://www.ubuntugeek.com/install-freeradius-on-ubuntu-15-04-server-and-manage-using-daloradius-freeradius-web-management-application.html
* https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-ubuntu-14-04