#/bin/bash

#adding elements to the database server

#changing host and hostname
sed 's/pleasechangeme/database/' /etc/hosts
sed 's/pleasechangeme/database/' /etc/hostname

#updating the system
sudo apt-get update -y

#adding the sql server
sudo apt-get install -y mysql-server git curl

#changing the address to webserver address
sed '40,55s/0.0.0.0/192.168.1.217' /etc/mysql/my.cnf

#reloading mysql so that it takes the new ip
sudo service mysql reload

