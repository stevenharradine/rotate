#!/bin/bash

activity=$1
user=$2
cmd=$3

sites=("application.project-enviroment.domain.com",
       "database.project-enviroment.domain.com" )

if [ $activity == "read" ]
  then
    for site in "${sites[@]}"
      do
        :
        ssh $user@$site cat /home/$user/.ssh/authorized_keys
     done
fi

if [ $activity == "write" ]
  then
    for site in "${sites[@]}"
      do
        :
        echo $cmd | ssh $user@$site "cat > /home/$user/.ssh/authorized_keys"
     done
fi