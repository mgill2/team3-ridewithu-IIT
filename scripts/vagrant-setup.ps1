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
      break
    }
  $cont=read-host "Do you want to delete any more boxes? (y/n)"
}while($cont -eq "y" -OR $cont -eq "Y") 


#deleteing old artifacts
$oldArt=read-host "Would you like to delete the old artifacts? (y/n)"

if ($oldArt -eq "y" -OR $oldArt -eq "Y")
{
  cd "./database"
  rm .vagrant
  rm ./Vagrantfile
  
  cd "../database-slave"
  rm .vagrant
  rm ./Vagrantfile
  
  cd "../webserver"
  rm .vagrant
  rm ./Vagrantfile
}

else 
{
  write-host "Be careful becuase when you do vagrant up it will take the old artifacts"
}

#asking the user to name the boxes
$name=read-host "Please name the box of the database server. Example: database-server"

if ($name -eq "")
{
  $name = "database-server"
  vagrant.exe box add ./ubuntu-vanilla-14045-database-virtualbox.box --name $name
}

else
{
  #running add box command
  vagrant.exe box add ./ubuntu-vanilla-14045-database-virtualbox.box --name $name
}
#getting box up and running
cd "./database"
vagrant.exe init database-server

#changing the ip address of the machine 
$ans=read-host "Would you like to make your database server a public IP? (y/n)"
  if ($ans -eq "y" -OR $ans -eq "Y")
  {
    $ip=read-host "What is the new IP you want? Example: 192.168.1.200"
    cat .\Vagrantfile | %{$'_ -replace "#config.vm.network `"public_network`"", `"config.vm.network `"public_network`", ip: `"$ip`""'}
  }

vagrant.exe up

#changing directories to build
cd "../"

#asking the user to name the boxes
$webserver=read-host "Please name the box of the webserver. Example: webserver"


if ($webserver -eq "")
{
  $webserver = "webserver"
  vagrant.exe box add ubuntu-vanilla-14045-webserver-virtualbox.box --name $webserver
}
else 
{
  #adding webserver box to box list
  vagrant.exe box add ubuntu-vanilla-14045-webserver-virtualbox.box --name $webserver
}

#getting box up and running
cd "./webserver"

vagrant.exe init webserver2

#changing the ip address of the machine 
$ans=read-host "Would you like to make your webserver a public IP? (y/n)"
  if ($ans -eq "y" -OR $ans -eq "Y")
  {
    $ip=read-host "What is the new IP you want? Example: 192.168.1.200"
    cat .\Vagrantfile | %{$'_ -replace "#config.vm.network `"public_network`"", `"config.vm.network `"public_network`", ip: `"$ip`""'}
  }

vagrant.exe up

#changing directories to build
cd "../"

#asking the user for a name for database slave and setting a default value if enter #is hit
$dataslave=read-host "Please name the box of the database slave. Example: database-slave"

if ($dataslave -eq "")
{
  $dataslave = "database-slave"
  vagrant.exe box add ubuntu-vanilla-14045-webserver-virtualbox.box --name $dataslave
}
else 
{
  #adding the vagrant box
  vagrant.exe box add ubuntu-vanilla-14045-database-slave-virtualbox.box --name $dataslave
}
cd "./database-slave"

vagrant.exe init $dataslave

#changing the ip address of the machine 
$ans=read-host "Would you like to make your database slave server a public IP? (y/n)"
  if ($ans -eq "y" -OR $ans -eq "Y")
  {
    $ip=read-host "What is the new IP you want? Example: 192.168.1.201"
    cat .\Vagrantfile | %{$'_ -replace "#config.vm.network `"public_network`"", `"config.vm.network `"public_network`", ip: `"$ip`""'}
  }

vagrant.exe up


