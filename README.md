# team-3-withu
ITMT 430 WithU RideShare project 2017

Team members and roles:
Zdenek- *Project Manager*
Dipen- *Developer*
Matt- *Operations*
Paul- *UI Design* 
Alejandro- *Security*

==============Some Notes========================

The .my.cnf for the master database is in the 
Database folder.

The other .my.cnf is in the scripts directory
which is for the slave database.

In the build folder make sure to have database
and webserver folders. ADD IF NEEDED! BEFORE 
RUNNING ANYTHING

================================================

### For scripting: Need to know

All the users first clone this directory:
https://github.com/illinoistech-itm/team-3-withu.git

(git clone https://github.com/illinoistech-itm/team-3-withu.git)

Now go to scripts directory

cd scripts

### FOR MAC USERS run:
>
>packer build --force ubuntu14045-vanilla-database.json
>
>packer build --force ubuntu14045-vanilla-webserver.json
>
>then run machusers.sh (if you dont want to do the vagrant up, vagrant box add, or if you want to do the steps manually see below)
>For Windows Users (see further below)
>
>if you dont feel comforatable doing the script do this
>
>go to the /team-3-withu/build
>
>vagrant box add ubuntu14045-vanilla-database.box --name database-server
>
>vagrant box add ubuntu14045-vanilla-webserver.box --name webserver2
>
>cd up a directory and then go into the build cd into webserver (if you do not have a folder create one) then
>vagrant ssh
>
>then open another terminal and go to the build directory and then database and do 
>vagrant ssh
>
>Or you can do it MANUALLY
>
>go into database folder (add one if you do not have one in build)
>
>vagrant init databaser-server
>
>vagrant up
>
>vagrant ssh
>
>go to webserver folder (add one if you do not have one in build) 
>
>vagrant init webserver2
>
>vagrant up 
>
>vagrant ssh

### For Windows Users
>
>packer build --force ubuntu14045-vanilla-database.json
>packer build --force ubuntu14045-vanilla-database.json
>
>For running the script vagrant-setup.ps1 (this skips the steps of removing boxes, vagrant init, and vagrant up)
>
>open up powershell as administrator 
>
>You have to run Set-ExecutionpPolicy while in an Administrator Shell
>
>Set that to unrestricted
>
>Then Yes
>
>Assuming that users are in scripts directory
>
>run vagrant-setup.ps1
>
>After you are done running the script then change it back to restricted for security purposes
>
>cd up a directory and then go into the build cd into webserver and vagrant ssh
>then open another terminal and go to the build directory and then database and do vagrant ssh
>
>or if your doing it manually these steps
>
>go into database folder (create one if needed)
>
>vagrant init databaser-server (or the one you created)
>
>vagrant up
>
>vagrant ssh
>
>go to webserver folder (create one if needed)
>
>vagrant init webserver2 (or the one you created)
>
>vagrant up 
>
>vagrant ssh
>
>after that you have everything ready to go

### After Webserver and Database are Set Up
>Change direcctory to database and do vim Vagrantfile
>
>In Vagrantfile, add find this line config.vm.network "public_network"
>
>Add your Database server ip to this line
>
>config.vm.network "public_network", ip: "yourIPGoesHere"
>
>Then do vagrant reload --provision
>
