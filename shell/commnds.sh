#!/bin/bash

status_check() {
    if [ $? -eq 0 ]; then
        echo -e "\e[32mSUCCESS\e[0m"
        sleep 2
    else
        echo -e "\e[31mFAILURE\e[0m"
    fi
}

read name 

echo "present working directory"
pwd
status_check


echo "varible form other file"
echo "my name is $name"
status_check

echo "commnd substute"
echo "to day date is $(date)" 
status_check


