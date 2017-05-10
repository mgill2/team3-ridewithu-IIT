#!/bin/bash -xe

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


#this is for adding elements to the webserver client

#updating
sudo apt-get update -y
if [ $? = 0 ]
then
  echo "updated successfully"
else
  echo "update did NOT complete"
fi

#upgrading
sudo apt-get upgrade -y
if [ $? = 0 ]
then
  echo "upgraded successfully"
else
  echo "upgrade did NOT complete"
fi

#installing mysql client, apache2, php5, mysql php5 mysql
sudo apt-get -y install apache2 php5 mysql-client php5-mysqlnd git

if [ $? = 0 ]
then
  echo "installed successfully"
else
  echo "install did NOT complete"
fi

#changes the hosts and hostname 
#sed 's/pleasechangeme/webserver/' /etc/hosts
#sed 's/pleasechangeme/webserver/' /etc/hostname
#if [ $? = 0 ]
#then
#  echo "sed updated the host and hostname files"
#  echo "restarting"
#  shutdown -r now
#else
#  echo "sed did NOT complete"
#fi

git clone "https://YOUR_TOKEN_HERE@github.com/illinoistech-itm/team-3-withu.git"
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
  echo "git pulled completed successfully"
else
  echo "git pull did not complete successfully"
fi

#removes the default page and adds our webpages, css, and js
sudo rm /var/www/html/index.html
if [ $? = 0 ]
then
  echo "removed index.html"
else
  echo "remove did NOT complete"
fi

cd ./src
if [ $? = 0 ]
then
  echo "cd into the src folder successfully"
else
  echo "cd did NOT complete"
fi

sudo cp -r *.html *.php js css img  /var/www/html
if [ $? = 0 ]
then
  echo "copied info into /var/www/html"
else
  echo "copy did NOT complete"
fi

exit 0
