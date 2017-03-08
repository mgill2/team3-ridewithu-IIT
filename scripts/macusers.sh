#!/bin/bash -xe

#make sure to chmod this script to run
#adding boxes for vagrant

#changing directory
cd "../build"

#adding database boxes
vagrant box add --name database-server ./ubuntu-vanilla-14045-database-virtualbox.box

#getting box up and running
cd "./database"
vagrant init database-server
vagrant up 
vagrant ssh

#changing directories to build
cd "../"

#adding webserver box to box list
vagrant box add ubuntu-vanilla-14045-webserver-virtualbox.box --name webserver2

#getting box up and running
cd "./webserver"

vagrant init webserver2
vagrant up
vagrant ssh




