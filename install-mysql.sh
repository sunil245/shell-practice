#!/bin/bash

USERID=$(id -u)
 
if [ $USERID -ne 0 ]
then
    echo "Error::: RUn with root user"
    exit 1
else
    echo "Script started running successfully"
fi


VALIDATE(){
    if [ $1 -eq 0 ]
    then
        echo "$2 is already installed"
        exit 1
    else
        echo "$2 is not installed starting to install"
    fi
}

dnf list installed mysql
if [ $? -ne 0 ] 
then 
    echo "mysql is not installed go and install"
    dnf install mysql -y
    VALIDATE $? "MYSQL"
else
    echo "Mysql is already installed nothing to do"
fi