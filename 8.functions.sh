#!/bin/bash

#install 3 packages - mysql, nginx, python3

#check if the user has privilages to install the softwares
if [ $(id -u) -ne 0 ]; then
    echo "You do not have sudo privilages to install the softwares"
    exit 1
else
    #checking if software is already installed"
    if ! rpm -q mysql &>/dev/null; then
        echo "mysql not found. Proceeding to install"
        #installing the software
        if dnf install mysql -y ; then
            echo "mysql installed successfully"
            exit 0
        else
            echo "mysql installation failed"
            exit 1
        fi
    else
        echo "my sql already installed on this system"
        exit 0
    fi
fi


