#!/bin/bash -xe

#make sure to chmod this script to run
#adding boxes for vagrant

#changing directory
cd "../build"

#showing the previous boxes
vagrant box list

echo "Do you want to remove another box?"
  read cont
  
while [ $cont = "y" ] || [ $cont = "Y" ];
 do
  echo "Would you like to remove any boxes? (y/n)"
  read awnser
  if [ $awnser = "y" ] || [ $awnser = "Y" ]
  then
    echo "Which box would you like to remove?"
    read rmBox
    vagrant box remove $rmBox
  else [ $awnser = "n" ] || [ $awnser = "N" ]
    echo "Exiting loop"
  fi
  echo "Do you want to remove another box?"
  read cont
done
#adding database boxes
echo "Please enter the name of your box you would like to create for the database. Example: database-server"
read name
vagrant box add --name $name ./ubuntu-vanilla-14045-database-virtualbox.box

#getting box up and running
cd "./database"
vagrant init $name
vagrant up

#changing directories to build
cd "../"

#adding webserver box to box list
echo "Please enter the name of your box you would like to create for the webserver. Example: webserver"
read name2
vagrant box add --name $name2 ubuntu-vanilla-14045-webserver-virtualbox.box 

#getting box up and running
cd "./webserver"

vagrant init $name2
vagrant up




