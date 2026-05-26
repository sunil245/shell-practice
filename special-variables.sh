#!/bin/bash

echo "All vaiables passed $@"
echo "Number of  variables passed $#"
echo "script name  $0"
echo "current directory $PWD"
echo "user $USER"
echo "home $HOME"
echo "PID $$"
sleep 0 &
echo "PID of last command in background $!"