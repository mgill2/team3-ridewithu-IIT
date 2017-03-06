#!/bin/bash

#adding users from a list to mysql database 
username=$(cat users | tr [" "] [":"] | cut -d: -f1)
usersize=${username[*]}

PASSWD="password"

 echo "Please enter root password"
 read rootpasswd

for((i=0;i<usersize;i++))

 
  
  mysql -u root -p$rootpasswd -e "CREATE USER ${username}@localhost IDENTIFIED BY '${PASSWD}';"
  #printf "${username}[i]"

done  
