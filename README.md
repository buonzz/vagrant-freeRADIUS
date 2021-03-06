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

It comes with daloRADIUS Web Inteface. to access it, visit http://192.168.33.81/daloradius/index.php

```
username: administrator
password: radius
```

To test the RADIUS server directly, execute inside the VM:

```
sudo radtest user1 testpwd localhost 18128 testing123
```

the above command uses radtest utility script to test a RADIUS server. the parameters explanation is:

* user1 - the username
* testpwd - the password
* localhost - hostname/ip
* 18128 - the port to connect with
* testing123 - shared secret

it should reply with

```
Sending Access-Request of id 238 to 127.0.0.1 port 1812
	User-Name = "user1"
	User-Password = "testpwd"
	NAS-IP-Address = 10.0.2.15
	NAS-Port = 18128
	Message-Authenticator = 0x00000000000000000000000000000000
rad_recv: Access-Accept packet from host 127.0.0.1 port 1812, id=238, length=20
```

## Usage

The machine has a fixed LAN address at 
[http://192.168.33.81/](http://192.168.33.81/)

Starting the RADIUS Server

```
sudo /etc/init.d/freeradius stop
```

Stopping the RADIUS Server
```
sudo /etc/init.d/freeradius start
```

Whenever you change the configuration files, you might want to run it in debug mode first. To do this, run:
```
sudo freeradius -X
```

### Configuration

Users is configured to be stored and checked against a MySQL database, here is the credentials:

```
# MySQL root user
username: root
password: secret

# radius db creds
username: radius
password: secret
database: radius
```

There is a test user already inserted to radcheck table

```
username: user1
password: testpwd
```

Configuration files of RADIUS can be found in /etc/freeradius


### Resources

* http://www.ubuntugeek.com/install-freeradius-on-ubuntu-15-04-server-and-manage-using-daloradius-freeradius-web-management-application.html
* https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-ubuntu-14-04
* http://www.daloradius.com/