#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
 
if [ $USERID -ne 0 ]
then
    echo -e "$R Error::: RUn with root user"
    exit 1
else
    echo "$G Script started running successfully"
fi


VALIDATE(){
    if [ $1 -eq 0 ]
    then
        echo "$Y $2 is already installed"
        exit 1
    else
        echo "$G $2 is not installed starting to install"
    fi
}

dnf list installed mysql
if [ $? -ne 0 ] 
then 
    echo "$Y mysql is not installed go and install"
    dnf install mysql -y
    VALIDATE $? "MYSQL"
else
    echo "$Y Mysql is already installed nothing to do"
fi