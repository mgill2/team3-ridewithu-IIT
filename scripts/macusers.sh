#!/bin/bash -xe

#make sure to chmod this script to run
#adding boxes for vagrant

#changing directory
cd "../build"

echo "Purging directories..."
if [ -d "$database" ]; then
  # Control will enter here if $DIRECTORY exists.
  rmdir database
fi

echo "Purging directories..."
if [ -d "$database-slave" ]; then
  # Control will enter here if $DIRECTORY exists.
  rmdir database-slave
fi

echo "Purging directories..."
if [ -d "$webserver" ]; then
  # Control will enter here if $DIRECTORY exists.
  rmdir webserver
fi

echo "Done."

echo "Checking if database directory has been created"
if [ ! -d "$database" ]; then
  # Control will enter here if $DIRECTORY doesn't exist.
  mkdir database
  echo "Database directory created"
fi

echo "Checking if database-slave directory has been created"
if [ ! -d "$database-slave" ]; then
  # Control will enter here if $DIRECTORY doesn't exist.
  mkdir database-slave
  echo "Database-slave directory created"
fi

echo "Checking if webserver directory has been created"
if [ ! -d "$webserver" ]; then
  # Control will enter here if $DIRECTORY doesn't exist.
  mkdir webserver
  echo "Webserver directory created"
fi

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
    break
  fi
done

#going into the build folder
cd "../"

#adding database boxes
echo "Please enter the name of your box you would like to create for the database. Example: database-server"
  read database

if [ $database = "" ] && [ $database = 0 ]
then
  $database = database

else
  vagrant box add ubuntu-vanilla-14045-database-virtualbox.box --name $database
fi

#getting box up and running
cd "./database"
vagrant init $database
vagrant up

#changing directories to build
cd "../"

#adding webserver box to box list
echo "Please enter the name of your box you would like to create for the webserver. Example: webserver"
  read webserver
  
if [ $webserver = "" ] && [ $webserver = 0 ]
then
  $webserver = webserver

else
  vagrant box add ubuntu-vanilla-14045-webserver-virtualbox.box --name $webserver
fi

#getting box up and running
cd "./webserver"

vagrant init $webserver
vagrant up

cd "../"

echo "Please enter the name of your box you would like to create for the database. Example: database-slave"
  read dataslave
  
if [ $dataslave = "" ] && [ $dataslave = 0 ]
then
  $dataslave = database-slave

else
  vagrant box add ubuntu-vanilla-14045-database-slave-virtualbox.box --name $dataslave
fi
  
#changing to database slave directory
cd "./database-slave"
vagrant init $dataslave
vagrant up



