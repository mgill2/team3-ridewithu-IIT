#going to the directory for database
#need to set-execution policy to unresricted to run this script then after
# you run the script and are done make sure to set-execution policy to restricted

cd "../build"

#running add box command
vagrant.exe box add ./ubuntu-vanilla-14045-database-virtualbox.box --name database-server

#getting box up and running
cd "./database"
vagrant.exe init database-server
vagrant.exe up 
vagrant.exe ssh

#changing directories to build
cd "../"

#adding webserver box to box list
vagrant.exe box add ubuntu-vanilla-14045-webserver-virtualbox.box --name webserver2

#getting box up and running
cd "./webserver"

vagrant.exe init webserver2
vagrant.exe up
vagrant.exe ssh

