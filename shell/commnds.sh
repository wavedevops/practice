#!bin/bash 

r=`\e[31m`
g=`\e[32m`
n=`\e[0m`

status_check() {
    if [ $? -eq 0 ]; then
        echo -e "$(g)SECCUSS$(n)"
    else
        echo -e "$(r)FAILURE$(n)"
}


echo "add a new user" 
useradd ramu
status_check

echo "add a group"
groupadd dev
status_check

echo "Adding user 'ramu' to the 'dev' group..."
usermod -aG dev ramu
status_check

echo "add a repo"
mkdir /app
status_check

echo "Add repo "app" to devops group"
chgrp dev /app
status_check

