#!/bin/bash

USERID=$(id -u)
 
if [ $USERID -ne 0 ]
then
    echo "Error::: RUn with root user"
    exit 1
else
    echo "Script started running successfully"
fi

dnf list installed mysql

if [ $? -eq 0 ]
then
    echo "mysql is already installed"
    exit 1
else
    echo "mysql is not installed starting to install"
fi

dnf install mysql -y

if [ $? -eq 0 ]
then
    echo "installing mysql is success"
else
    echo "installing mysql is failed"
    exit 1
fi