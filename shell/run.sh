#!/bin/bash

echo -e "\e[32mplease enter your name :\e[0m"
read name
echo -e "\e[32mplease enter your age :\e[0m"
read age
echo -e "\e[32mplease enter your cource :\e[0m"
read course
echo -e "\e[33mname is '$name' , age is '$age' , cource is '$course'.\e[0m"

if [[ "$course" == "DevOps" ]]; then
    echo "This student is eligible for DevOps."
elif [[ "$course" == "Python" ]]; then
    echo "This student is eligible for Python."
else
    echo "This student is not eligible for my institute."
fi