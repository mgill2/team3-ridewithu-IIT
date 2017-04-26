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
echo "mysql-server mysql-server/root_password password Master67" | sudo debconf-set-selections 
echo "mysql-server mysql-server/root_password_again password Master67" | sudo debconf-set-selections
sudo apt-get -y install mysql-server
if [ $? = 0 ]
then
  echo "installed mysql server!"
else
  echo "mysql install did NOT complete"
fi

#changing the address to webserver address
#sed 's/127\.0\.0\.1/192\.168\.1\.220/' /etc/mysql/my.cnf
#if [ $? = 0 ]
#then
#  echo "sed updated the my.cnf file"
#else
#  echo "sed did NOT complete"
#fi

#reloading mysql so that it takes the new ip
#sudo /etc/init.d/mysql restart
#if [ $? = 0 ]
#then
#  echo "mysql reload completed"
#else
#  echo "mysql did NOT complete"
#fi

git clone "https://3e293382e7c9adec19edf54b8ff7e259143725bb@github.com/illinoistech-itm/team-3-withu.git"
if [ $? = 0 ]
then
  echo "added git hub repo successfully"
else
  echo "github clone did NOT complete"
fi

cd team-3-withu
sudo git pull
if [ $? = 0 ]
then
  echo "git pull executed successfully"
else
  echo "git pull did NOT complete"
fi

cd ./scripts/Database
cp .my.cnf ~/

if [ $? = 0 ]
then
  echo "copy of .my.cnf completed successfully"
else
  echo "copying .my.cnf did NOT complete"
fi

mysql -u root < createdata.sql

if [ $? = 0 ]
then
  echo "database created successfully"
else
  echo "database did NOT create"
fi

#running mysql script in ./Database folder to create users
mysql -u root < createuser.sql
if [ $? = 0 ]
then
  echo "users created successfully"
else
  echo "users did NOT create"
fi


#changing the bind address to database master address
sudo sed -i 's/127\.0\.0\.1/192\.168\.1\.220/' /etc/mysql/my.cnf
if [ $? = 0 ]
then
  echo "sed updated the my.cnf file"
else
  echo "sed did NOT complete"
fi

#changing the server number so that the mysql slave can reach the master for #replication
sudo sed -i 's/#server-id\t\t= 1/server-id = 1/' /etc/mysql/my.cnf
if [ $? = 0 ]
then
  echo "changed the server number to 2 completed successfully"
else
  echo "changing server number did NOT complete"
fi

#changing line number 88 to remove the # for log_bin
sudo sed -i '88s/#//' /etc/mysql/my.cnf
if [ $? = 0 ]
then
  echo "changed the # to space completed successfully"
else
  echo "changing server number did NOT complete"
fi

#changing the server number so that the mysql slave can reach the master for #replication
sudo sed -i 's/#binlog_do_db\t\t= include_database_name/binlog_do_db\t\t= master/' /etc/mysql/my.cnf
if [ $? = 0 ]
then
  echo "changed binlog_do_db name to master completed successfully"
else
  echo "changing server number did NOT complete"
fi

#restarting mysql server to take the new changes
sudo service mysql restart
if [ $? = 0 ]
then
  echo "restarting mysql completed successfully"
else
  echo "mysql restart did NOT complete"
fi


exit 0