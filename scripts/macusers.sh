#!/bin/bash -xe

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





