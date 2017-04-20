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

#removing older artifacts
echo "would you like to delete the older artifacts? (y/n)"
  read delOld
if [ $awnser = "y" ] || [ $awnser = "Y" ]
  then
    cd "./database"
    rm .vagrant
    rm Vagrantfile

    cd "../database-slave"
    rm .vagrant
    rm Vagrantfile

    cd "../webserver"
    rm .vagrant
    rm Vagrantfile

    #going into the build folder
    cd "../"
  else [ $awnser = "n" ] || [ $awnser = "N" ]
    echo "Be careful when running vagrant init and vagrant up it will take the old artifact"
fi  

#going into the build folder
cd "../"

#adding database boxes
echo "Please enter the name of your box you would like to create for the database. Example: database-server"
  read database
vagrant box add --name $database ./ubuntu-vanilla-14045-database-virtualbox.box

#getting box up and running
cd "./database"
vagrant init $database
vagrant up

#changing directories to build
cd "../"

#adding webserver box to box list
echo "Please enter the name of your box you would like to create for the webserver. Example: webserver"
  read webserver
vagrant box add --name $webserver ubuntu-vanilla-14045-webserver-virtualbox.box 

#getting box up and running
cd "./webserver"

vagrant init $webserver
vagrant up

cd "../"

echo "Please enter the name of your box you would like to create for the database. Example: database-slave"
  read dataslave
vagrant box add --name $dataslave ubuntu-vanilla-14045-database-slave-virtualbox.box

#changing to database slave directory
cd "./database-slave"
vagrant init $dataslave
vagrant up



