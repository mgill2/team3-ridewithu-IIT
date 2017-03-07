#going to the directory for database

cd "../build"

#running add box command
vagrant.exe box add --name database-server ubuntu-vanilla-14045-server-database-virtualbox.box

#getting box up and running
cd "./database"
vagrant.exe init database-server
vagrant.exe up 
vagrant.exe ssh

#changing directories
cd "../"

#adding webserver box to box list
vagrant.exe box add --name webserver ubuntu-vanilla-14045-webserver-virtualbox.box

#getting box up and running
cd "./webserver"

vagrant.exe init webserver
vagrant.exe up
vagrant.exe ssh

