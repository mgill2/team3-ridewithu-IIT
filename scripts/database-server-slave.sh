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
sed 's/pleasechangeme/database-slave/' /etc/hostname
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
echo "mysql-server mysql-server/root_password password Script67" | sudo debconf-set-selections 
echo "mysql-server mysql-server/root_password_again password Script67" | sudo debconf-set-selections
sudo apt-get -y install mysql-server
if [ $? = 0 ]
then
  echo "installed mysql server!"
else
  echo "mysql install did NOT complete"
fi

#adding git and using a token to clone for authentication
git clone "https://3e293382e7c9adec19edf54b8ff7e259143725bb@github.com/illinoistech-itm/team-3-withu.git"
if [ $? = 0 ]
then
  echo "added git hub repo successfully"
else
  echo "github clone did NOT complete"
fi

#git pulling in case of updates
cd team-3-withu
sudo git pull
if [ $? = 0 ]
then
  echo "git pull executed successfully"
else
  echo "git pull did NOT complete"
fi

#coping the .my.cnf file for mysql to run without password prompt
cd ./scripts
cp .my.cnf ~/

if [ $? = 0 ]
then
  echo "copy of .my.cnf completed successfully"
else
  echo "copying .my.cnf did NOT complete"
fi

#running the sql script to create the database
cd ./Database
mysql -u root < createdata.sql

if [ $? = 0 ]
then
  echo "database slave created successfully"
else
  echo "database slave did NOT create"
fi

#running mysql script from ./Database folder to run the change master to command in #mysql so the slave can replicate
mysql -u root < change-master-to.sql
if [ $? = 0 ]
then
  echo "change master to command completed successfully"
else
  echo "change master to command did NOT complete"
fi


#changing the bind address to database slave address
sudo sed -i 's/127\.0\.0\.1/192\.168\.1\.221/' /etc/mysql/my.cnf
if [ $? = 0 ]
then
  echo "sed updated the my.cnf file"
else
  echo "sed did NOT complete"
fi

#changing line number 88 to remove the # for log_bin
sudo sed -i '88s/#//' /etc/mysql/my.cnf
if [ $? = 0 ]
then
  echo "changed the # to space completed successfully"
else
  echo "changing server number did NOT complete"
fi

#changing the server number so that the mysql slave can reach the master for #replication. Must be the name of the database you want to replicate on master. #Example: master
sudo sed -i 's/#binlog_do_db\t\t= include_database_name/binlog_do_db\t\t= master/' /etc/mysql/my.cnf
if [ $? = 0 ]
then
  echo "changed binlog_do_db name to master completed successfully"
else
  echo "changing server number did NOT complete"
fi

#changing the server number so that the mysql slave can reach the master for #replication needs to be a different server number than master.
sudo sed -i 's/#server-id\t\t= 1/server-id\t\t= 2/' /etc/mysql/my.cnf
if [ $? = 0 ]
then
  echo "changed the server number to 2 completed successfully"
else
  echo "changing server number did NOT complete"
fi


exit 0