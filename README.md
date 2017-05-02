# team-3-withu
ITMT 430 WithU RideShare project 2017

Team members and roles:
Zdenek- *Project Manager*
Dipen- *Developer*
Matt- *Operations*
Paul- *UI Design* 
Alejandro- *Security*

==============GETTING STARTED-(IMPORTANT)=======================

The .my.cnf for the master database is in the 
Database folder.

The other .my.cnf is in the scripts directory
which is for the slave database.

In the build directory, make sure to have database, database-slave,
and webserver directories. The script should add these if they do not exist but ADD IF NEEDED!

If not running local host change the IP in
the sed commands in the database and 
database-slave scripts.

also you need to change the vagrant file
for the ips that you need

================================================

### FIRST STEPS: 
For scripting: Need to know

1. First, clone this directory if you have not done so already:
https://github.com/illinoistech-itm/team-3-withu.git

```git clone https://github.com/illinoistech-itm/team-3-withu.git```

2. Go to scripts directory

```cd scripts```

3. ### FOR MAC/LINUX USERS run each of these one at a time, starting the next one after the other is completely finished:

```<b>packer build --force ubuntu14045-vanilla-database.json</b>```

```<b>packer build --force ubuntu14045-vanilla-database-slave.json</b>```

```<b>packer build --force ubuntu14045-vanilla-webserver.json</b>```

(Note: this will take some time between each one, the power of the machine you use will vary the time greatly)


 2. After the builds have been completed:
 * run machusers.sh:
```<b>./macusers.sh</b>```
 (if you dont want to do the vagrant up, vagrant box add, or if you want to do the steps manually see below)


if you dont feel comfortable doing the script do this:

* go to the /team-3-withu/build

```<b>vagrant box add ubuntu14045-vanilla-database.box --name database-server</b>```

```<b>vagrant box add ubuntu14045-vanilla-webserver.box --name webserver2</b>```

* cd up a directory:
```<b>cd ..</b>```
Then, go into the build directory, cd into webserver directory (NOTE: if you do not have a directory for this already, create one) 
 then, 
```<b>vagrant ssh</b>```

then, open another terminal, and go into the build directory again, cd into database directory (NOTE: if you do not have a directory for this already, create one)
then, 
```<b>vagrant ssh</b>```

OR, you can do it MANUALLY

go into database folder (add one if you do not have one in build)

```<b>vagrant init database-server</b>``` (if you named it this)

```<b>vagrant up</b>```

```<b>vagrant ssh</b>```

go to webserver folder (add one if you do not have one in build) 

```<b>vagrant init webserver</b>``` (if you named it this)

```<b>vagrant up</b> ```

```<b>vagrant ssh</b>```

3. ### FOR WINDOWS USERS run each of these one at a time, starting the next one after the other is completely finished:

```<b>packer build --force ubuntu14045-vanilla-database.json</b>```

```<b>packer build --force ubuntu14045-vanilla-webserver.json</b>```

```<b>packer build --force ubuntu14045-vanilla-database-slave.json</b>```

For running the script vagrant-setup.ps1 (this skips the steps of removing boxes, vagrant init, and vagrant up):

* open up powershell as administrator 

* You have to run Set-ExecutionpPolicy while in an Administrator Shell

* Set that to unrestricted

* Then Yes

* Assuming that users are in scripts directory

* run vagrant-setup.ps1

* After you are done running the script then change it back to restricted for security purposes

* cd up a directory and then go into the build cd into webserver and vagrant ssh
then open another terminal and go to the build directory and then database and do vagrant ssh

OR, you can do it MANUALLY

go into database folder (add one if you do not have one in build)

```<b>vagrant init database-server</b>``` (if you named it this)

```<b>vagrant up</b>```

```<b>vagrant ssh</b>```

go to webserver folder (add one if you do not have one in build) 

```<b>vagrant init webserver</b>``` (if you named it this)

```<b>vagrant up</b> ```

```<b>vagrant ssh</b>```

4. ### After Webserver and Database are Set Up:

* Change directory to database, then database-salve, then webserver, and do vim Vagrantfile

* In Vagrantfile, add find this line config.vm.network "public_network"

* Add your Database server ip to this line

```config.vm.network "public_network", ip: "yourIPGoesHere"```

* Then do vagrant reload --provision in each one.


############ MYSQL Master Slave Replication steps ##############

1. Login into the database vagrant box and do if you do not run the scripts
  	b. Show databases;
		c. Use (database name);
		d. FLUSH TABLES WITH READ LOCK;
		e. Show master status;
    f. Write down the file and the position
    g. UNLOCK TABLES;
  run sudo service mysql restart
    
2. Login into the slave vagrant box
    b. run change-master-to.sql in Database folder using mysql < change-master-to.sql 
    c. sudo service mysql restart

