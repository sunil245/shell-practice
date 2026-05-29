#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
PACKAGES=("mysql", "python")
 
if [ $USERID -ne 0 ]
then
    echo -e "$R Error::: RUn with root user $N"
    exit 1
else
    echo -e "$G Script started running successfully $N"
fi

for package in $@
do
    dnf list installed $package
    if [ $? -ne 0 ]
    then
        echo "$package started installing"
        dnf install $package -y
        VALIDATE $? "$package" 
    else
        echo "$package already installed"
    fi

done

VALIDATE(){
    if [ $1 -eq 0 ]
    then
        echo -e "$Y $2 is already $N installed"
        exit 1
    else
        echo -e "$G $2 is not installed starting to install $N"
    fi
}

