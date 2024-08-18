#!/bin/bash

DISK_SPACE=$( df -hT | grep xfs )
DISK_THRESHOL="80"

while IFS= read -r line
do
    USAGE=$(echo $line)

done <<<"$DISK_SPACE"