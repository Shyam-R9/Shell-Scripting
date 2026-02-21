#!/bin/bash

#script to install mysql if not already installed.

echo "DEBUG: Starting script..."

#check user has permissions to install the software
if [ $(id -u) -ne 0 ]; then
    echo "You don't have privilages to install the  software"
    exit 1
fi

#check if mysql is already installed
if ! rpm -q mysql &>/dev/null; then
    echo "mysql not installed, proceeding to install"
    if dnf install mysql -y; then
        echo "mysql installed successfully"
        exit 0
    else
        echo "mysql installation failed"
        exit 1
    fi

else
    echo "mysql already installed"
    exit 0
fi






