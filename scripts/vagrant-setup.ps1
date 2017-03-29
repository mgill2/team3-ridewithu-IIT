#going to the directory for database / webserver
#run powershell as admin need to set-execution policy to unresricted to run this script 
#then after you run the script and are done make sure to set-execution policy to #restricted for security

#cd to the build directory
cd "../build"

DO
{
  $ans=read-host "Do you want to delete any boxes? (y/n)"
    if ($ans -eq "y" -OR $ans -eq "Y")
    {
      write-host "These are the current boxes"
      vagrant.exe box list
      $rm=read-host "what boxes would you like to delete?"
      vagrant.exe box remove $rm
    }
    else 
    {
      write-host "Maybe next time!"
    }
  $cont=read-host "Do you want to delete any more boxes? (y/n)"
}while($cont -eq "y" -OR $cont -eq "Y") 

#asking the user to name the boxes
$name=read-host "Please name the box of the database server. Example: database-server"

#running add box command
vagrant.exe box add ./ubuntu-vanilla-14045-database-virtualbox.box --name $name

#getting box up and running
cd "./database"
vagrant.exe init database-server
vagrant.exe up

#changing directories to build
cd "../"

#asking the user to name the boxes
$name2=read-host "Please name the box of the webserver. Example: webserver2"

#adding webserver box to box list
vagrant.exe box add ubuntu-vanilla-14045-webserver-virtualbox.box --name $name2

#getting box up and running
cd "./webserver"

vagrant.exe init webserver2
vagrant.exe up


