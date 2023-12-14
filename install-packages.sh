#!/bin/bash
ID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"

TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE= "/tmp/$0-$TIMESTAMP.log"

echo "script stareted executing at $TIMESTAMP" &>> $LOGFILE

VALIDATE(){
        if [ $1 -ne 0 ]
        then 
            echo -e "$2 ...$R FAILED $N"
        else
            echo -e "$2...$G SUCESS $N"
        fi
    }
    if [ $ID -ne 0 ] 
    then 
        echo "ERROR:: Please run this script with root user "
        exit 1 # you can give other than 0
    else 
        echo "you are root user "
    fi # fi means reverse of if, indicating condition end

    for package in $@
    do 
        yum list installed $package &>> $LOGFILE #check installed or not
        if [ $? -ne 0 ] #if not installed 
        then 
            yum install $package -y &>> $LOGFILE #install the packages
            VALIDATE $? "Installing of $package" #validate 
        else 
            echo -e "$package alredy installed ...$R SKIPPING $N"
        fi

    done