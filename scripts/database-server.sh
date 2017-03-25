#/bin/bash -xe

# http://superuser.com/questions/196848/how-do-i-create-an-administrator-user-on-ubuntu
# http://unix.stackexchange.com/questions/1416/redirecting-stdout-to-a-file-you-dont-have-write-permission-on
# This line assumes the user you created in the preseed directory is vagrant
echo "vagrant ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/init-users
sudo cat /etc/sudoers.d/init-users


# Installing vagrant keys
wget --no-check-certificate 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub'
sudo mkdir -p /home/vagrant/.ssh
sudo chown -R vagrant:vagrant /home/vagrant/.ssh
cat ./vagrant.pub >> /home/vagrant/.ssh/authorized_keys
sudo chown -R vagrant:vagrant /home/vagrant/.ssh/authorized_keys
echo "All Done!"


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
sed -i 's/127\.0\.0\.1/192\.168\.1\.220/' /etc/mysql/my.cnf
if [ $? = 0 ]
then
  echo "sed updated the my.cnf file"
else
  echo "sed did NOT complete"
fi

#reloading mysql so that it takes the new ip
sudo service mysql restart
if [ $? = 0 ]
then
  echo "mysql reload completed"
else
  echo "mysql did NOT complete"
fi

exit 0