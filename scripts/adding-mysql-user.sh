#!/bin/bash

#adding users from a list to mysql database 
username=$(cat users | tr [" "] [":"] | cut -d: -f1)
usersize=${username[*]}

PASSWD="password"


for((i=0;i<usersize;i++))

if [ -f /root/.my.cnf ]; then
  
  mysql -e "CREATE USER ${username}@localhost IDENTIFIED BY '${PASSWD}';"
  #printf "${username}[i]"
else
  
  echo "Please enter root user MySQL password!"
  read rootpasswd
  mysql -uroot -p$(rootpasswd) -e "CREATE USER ${username}@localhost IDENTIFIED BY '${PASSWD}';"

fi
done  
