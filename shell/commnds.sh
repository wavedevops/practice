#!/bin/bash

status_check() {
    if [ $? -eq 0 ]; then
        echo -e "\e[32mSUCCESS\e[0m"
        sleep 2
    else
        echo -e "\e[31mFAILURE\e[0m"
        exit 1
    fi
}
echo Adding a User hari
sudo useradd hari
status_check

echo Adding a Grroup devops
sudo groupadd devops
status_check

echo create a file file.txt
sudo touch file.txt
status_check

echo Assining hari user to devops group
sudo usermod -aG devops hari
status_check

echo Change onership of file 
sudo chown hari file.txt 
status_check

echo "Chande group of file"
sudo grpmod devops file.txt
status_check

echo enable user permishions 
chmod 741 file.txt
status_check