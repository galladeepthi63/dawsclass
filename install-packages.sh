#!/bin/bash
ID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"

if [ $ID ne 0 ] 
then 
    echo "ERROR:: Please run this script with root user "
    exit 1
else 
    echo "you are root user "
fi
