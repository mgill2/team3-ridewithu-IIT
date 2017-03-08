# team-3-withu
ITMT 430 WithU RideShare project 2017

Team members and roles:
Zdenek- *Project Manager*
Dipen- *Developer*
Matt- *Operations*
Paul- *UI Design* 
Alejandro- *Security*


For scripting: Need to know

RUN ALL COMMANDS IN THE SCRIPTING FOLDER

For Mac users run:
packer build -force ubuntu14045-vanilla-database.json
packer build -force ubuntu14045-vanilla-webserver.json

then run machusers.sh (if you dont want to do the vagrant up, vagrant box add, or vagrant ssh (work in progress))

if you dont feel comforatable doing the script do this

go to the /team-3-withu/build
create two folders 

vagrant box add ubuntu14045-vanilla-database.box --name database-server
vagrant box add ubuntu14045-vanilla-webserver.box --name webserver2



after that you have everything ready to go

 

