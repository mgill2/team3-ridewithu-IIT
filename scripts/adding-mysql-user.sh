#!/bin/bash

#adding users from a list to mysql database 
username=$(cat user.txt | tr [" "] [":"] | cut -d: -f1)
usersize=${username[*]}

PASSWD="password"

 for((i=0;i<usersize;i++))

  if [ -f ./.my.cnf ]; then
    mysql -u root -p -e "CREATE USER ${username}@localhost IDENTIFIED BY '${PASSWD}';"
    #printf "${username}[i]"

  fi
  
done  
