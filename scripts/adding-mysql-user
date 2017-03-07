#!/bin/bash

#adding users from a list to mysql database 
username=$(cat user.txt | tr [" "] [":"] | cut -d: -f1)
usersize=${username[*]}

PASSWD="password"

 for((i=0;i<usersize;i++))

  if [ -f ./.my.cnf ]; then
  
    #mysql -u root -e "CREATE USER '${username}'@'192.168.1.209' IDENTIFIED BY '${PASSWD}';"
    #printf "${username}[i]"

  fi
  
  
done  
