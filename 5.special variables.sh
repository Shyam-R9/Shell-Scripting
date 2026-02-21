#!/bin/bash

echo "All arguments passed to the script: $@"
echo "No of arguments passed to the script: $#"
echo "Name of the script: $0"
echo "Present Working Directory: $PWD"
echo "Home Directory: $HOME"
echo "User running the script: $USER"
echo "PID of the current script: $$"
sleep 10 &
echo "PID of the last command running in the background: $!"
echo "All argumets passed to the script: $*"