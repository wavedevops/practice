#!/bin/bash

N="\e[0m"
R="\e[31m]"
G="\e[32m"

SOURCE_DIRECTORY=/tmp/app-logs

if[ -d $SOURCE_DIRECTORY ];
then
     echo -e "$G source directory already exists $N"
else
     echo -e "$R $SOURCE_DIRECTORY desnot ecits $N"
fi

#!/bin/bash

N="\e[0m"
R="\e[31m"
G="\e[32m"

SOURCE_DIRECTORY="/tmp/app-logs"

if [ -d "$SOURCE_DIRECTORY" ]; 
then
    echo -e "${G}Source directory already exists${N}"
else
    echo -e "${R}${SOURCE_DIRECTORY} does not exist${N}"
fi