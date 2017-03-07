#!/bin/bash -xe

#this is for adding elements to the database server client

#updating
sudo apt-get update -y

#installing mysql client, apache2, php5, mysql php5 mysql
sudo apt-get -y install apache2 php5 mysql-client php5-mysqlnd libapach2-mod-php php-mcrypt php-xml git

#changes the hosts and hostname 
sed 's/pleasechangeme/webserver/' /etc/hosts
sed 's/pleasechangeme/webserver/' /etc/hostname

rm -r /var/www/html
cp index.html css js login Forum /var/www


