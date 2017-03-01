#/bin/bash

#adding elements to the database server

#changing host and hostname
sed 's/pleasechangeme/database/' /etc/hosts
sed 's/pleasechangeme/database/' /etc/hostname

#updating the system
sudo apt-get update -y
if [ $? = 0 ]
then
  echo "update completed"
else
  echo "update did NOT complete"
end

#adding the sql server
sudo apt-get install -y mysql-server git curl
if [ $? = 0 ]
then
  echo "update completed"
else
  echo "update did NOT complete"
end

#changing the address to webserver address
sed '40,55s/0.0.0.0/192.168.1.217' /etc/mysql/my.cnf
if [ $? = 0 ]
then
  echo "update completed"
else
  echo "update did NOT complete"
end

#reloading mysql so that it takes the new ip
sudo service mysql reload
if [ $? = 0 ]
then
  echo "update completed"
else
  echo "update did NOT complete"
end

