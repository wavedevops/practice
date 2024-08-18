#!/bin/bash

DISK_SPACE=$(df -hT | grep xfs)
DISK_THRESHOL="80"

while IFS= read -r line
do
  USAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d '%' -f1) 

done <<< $DISK_SPACE