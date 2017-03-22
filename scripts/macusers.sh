#!/bin/bash -xe

#make sure to chmod this script to run
#adding boxes for vagrant

#changing directory
cd "../build"

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




