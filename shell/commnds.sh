#!/bin/bash

status_check() {
    if [ $? -eq 0 ]; then
        echo -e "\e[32mSUCCESS\e[0m"
        sleep 5
    else
        echo -e "\e[31mFAILURE\e[0m"
        exit 1
    fi
}

sudo useradd hari
status_check



##

