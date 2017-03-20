# team-3-withu
ITMT 430 WithU RideShare project 2017

Team members and roles:
Zdenek- *Project Manager*
Dipen- *Developer*
Matt- *Operations*
Paul- *UI Design* 
Alejandro- *Security*


For scripting: Need to know

All the users first clone this directory:
https://github.com/illinoistech-itm/team-3-withu.git

(git clone https://github.com/illinoistech-itm/team-3-withu.git)

Now go to scripts directory

cd scripts

FOR MAC USERS run:

packer build -force ubuntu14045-vanilla-database.json

packer build -force ubuntu14045-vanilla-webserver.json

then run machusers.sh (if you dont want to do the vagrant up, vagrant box add, or vagrant ssh (work in progress))

if you dont feel comforatable doing the script do this

go to the /team-3-withu/build

vagrant box add ubuntu14045-vanilla-database.box --name database-server

vagrant box add ubuntu14045-vanilla-webserver.box --name webserver2

For Mac/Linux Users (if you going to run the a script run macusers.sh this is becuase there is a powershell script for this but we also made one for mac/linux users to run vagrant init and up)

cd up a directory and then go into the build cd into webserver and vagrant ssh
then open another terminal and go to the build directory and then database and do vagrant ssh

Or you can do it manually

go into database folder

vagrant init databaser-server

vagrant up

vagrant ssh

go to webserver folder 

vagrant init webserver2

vagrant up 

vagrant ssh

For Windows Users

You have to run Set-ExecutionpPolicy while in an Administrator Shell

Set that to unrestricted

And yes, after you are done running the script then change it back to restricted for security purposes

Assuming that users are in scripts directory

packer build --force ubuntu14045-vanilla-database.json

packer build --force ubuntu14045-vanilla-webserver.json

or for windows users 

packer build -force ubuntu14045-vanilla-database.json
packer build -force ubuntu14045-vanilla-database.json

then run vagrant-setup.ps1 

cd up a directory and then go into the build cd into webserver and vagrant ssh
then open another terminal and go to the build directory and then database and do vagrant ssh

or if your doing it manually these steps

go into database folder

vagrant init databaser-server

vagrant up

go to webserver folder 

vagrant init webserver2

vagrant up 

after that you have everything ready to go

 

