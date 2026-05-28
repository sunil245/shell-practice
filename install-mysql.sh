#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
 
if [ $USERID -ne 0 ]
then
    echo -e "$R Error::: RUn with root user $N"
    exit 1
else
    echo "$G Script started running successfully $N"
fi


VALIDATE(){
    if [ $1 -eq 0 ]
    then
        echo "$Y $2 is already $N installed"
        exit 1
    else
        echo "$G $2 is not installed starting to install $N"
    fi
}

dnf list installed mysql
if [ $? -ne 0 ] 
then 
    echo "$Y mysql is not installed go and install $N"
    dnf install mysql -y
    VALIDATE $? "MYSQL"
else
    echo "$Y Mysql is already installed nothing to do $N"
fi