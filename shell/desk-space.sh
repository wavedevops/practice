#!/bin/bash

DISK_SPACE=$(df -hT | grep xfs)
DISK_THRESHOL="10"

while IFS= read -r line
do
   USAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d '%' -f1) 
   FOLDER=$(echo $line | awk -F " " '{print $NF}')
   if [ $USAGE -ge $DISK_THRESHOL ]
   then
       echo " $FOLDER is more than $DISK_THRESHOL , current usage is $USAGE"
   fi
done <<< $DISK_SPACE