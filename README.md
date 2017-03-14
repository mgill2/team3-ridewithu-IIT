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

go into database folder

vagrant init databaser-server

vagrant up

vagrant ssh

go to webserver folder 

vagrant init webserver2

vagrant up 

vagrant ssh

For Windows Users

Assuming that users are in scripts directory

packer build -force ubuntu14045-vanilla-database.json

packer build -force ubuntu14045-vanilla-webserver.json

then run vagrant-setup.ps1 

or if your doing it manually these steps

go into database folder

vagrant init databaser-server

vagrant up

vagrant ssh

go to webserver folder 

vagrant init webserver2

vagrant up 

vagrant ssh

after that you have everything ready to go

 

