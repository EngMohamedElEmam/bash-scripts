#!/bin/bash

if [ -d "config" ]
then
    printf "Listing config directory\n"
    config_dir=$(ls -lhr config)
else
    printf "Directory not found, creating one and coping the config files!\n"
    mkdir config
    cp -R /home/emam/old-config/* /home/emam/config/
    config_dir=$(ls -lhr config)
fi

printf "Here's all the config files:\n$config_dir\n"

ls  /home/emam/config/* | wc -l | while read output;
do
    if [ "$output" = 2 ]
    then
        printf "There is a 2 Files in The Directory\n"
    elif [ "$output" = 3 ]
    then
        printf "There is a 3 Files in The Directory\n"
    else
        printf "There is a $output Files in The Directory\n"
    fi
done

#accept input from user ./dir_script.sh <input> | example ./dir_script.sh ahmed
user=$1
if [ $user == 'emam' ] # $user is the input user name
then
    printf "The user is administrator and have access to configure the server\n"
else
    printf "The user is not administrator and will create a new admin user called $1\n"
    sudo adduser $1
    sudo usermod -aG sudo $1
    sudo passwd emam # password for the new user
    printf "The user has been created and has access\n"
fi
