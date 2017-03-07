#!/bin/bash -xe

#this is for adding elements to the webserver client

#updating
sudo apt-get update -y
if [ $? = 0 ]
then
  echo "added git hub repo successfully"
else
  echo "github clone did NOT complete"
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
sed 's/pleasechangeme/webserver/' /etc/hosts
sed 's/pleasechangeme/webserver/' /etc/hostname

#adding github repo 
repository="https://github.com/illinoistech-itm/team-3-withu.git"
#localFolder=~/
git clone "$repository"
if [ $? = 0 ]
then
  echo "added git hub repo successfully"
else
  echo "github clone did NOT complete"
fi

#removes the default page and adds our webpages, css, and js
rm -r /var/www/html
cp index.html welcome.html css js form.html forumcss.css img php screen.css /var/www/html
if [ $? = 0 ]
then
  echo "copied info into /var/www"
else
  echo "copy did NOT complete"
fi

exit 0