#!/bin/bash

#adding users from a list to mysql database 
username=$(cat users | tr [" "] [":"] | cut -d: -f1)
usersize=${username[*]}

PASSWD="password"


for((i=0;i<usersize;i++))

  echo "Please enter root password"
  read rootpasswd
  
  mysql -u root -p$rootpasswd -e "CREATE USER ${username}@localhost IDENTIFIED BY '${PASSWD}';"
  #printf "${username}[i]"

done  
