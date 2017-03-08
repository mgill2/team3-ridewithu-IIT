#/bin/bash -xe

#adding elements to the database server

#changing host and hostname
#sed 's/pleasechangeme/database/' /etc/hosts
sed 's/pleasechangeme/database/' /etc/hostname
if [ $? = 0 ]
then
  echo "sed updated the host and hostname files"
else
  echo "sed did NOT complete"
fi

#updating the system
sudo apt-get update -y
if [ $? = 0 ]
then
  echo "update completed"
else
  echo "update did NOT complete"
fi

#installing debconf-utils
sudo apt-get install -y debconf-utils
if [ $? = 0 ]
then
  echo "installed debconf-utils"
else
  echo "debconf did NOT complete"
fi

#adding the sql server
echo "mysql-server mysql-server/root_password password Password" | sudo debconf-set-selections 
echo "mysql-server mysql-server/root_password_again password Password" | sudo debconf-set-selections
sudo apt-get -y install mysql-server
if [ $? = 0 ]
then
  echo "installed mysql server!"
else
  echo "mysql install did NOT complete"
fi

#changing the address to webserver address
sed -i 's/0\.0\.0\.0/192\.168\.1\.217' /etc/mysql/my.cnf
if [ $? = 0 ]
then
  echo "sed updated the my.cnf file"
else
  echo "sed did NOT complete"
fi

#reloading mysql so that it takes the new ip
sudo service mysql reload
if [ $? = 0 ]
then
  echo "mysql reload completed"
else
  echo "mysql did NOT complete"
fi

exit 0