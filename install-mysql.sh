#!/bin/bash

USERID=$(id -u)
 
if [ $USERID -ne 0 ]
then
    echo "Error::: RUn with root user"
    #exit 1
else
    echo "Script started running successfully"
fi

dnf install mysqlhb

if [ $? -eq 0 ]
then
    echo "installing mysql is success"
else
    echo "installing mysql is failed"
    exit 1
fi