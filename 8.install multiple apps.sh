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
            
        else
            echo "mysql installation failed"
            exit 1
        fi
    else
        echo "mysql already installed on this system"
      
    fi

    #checking if software is already installed"
    if ! rpm -q nginx &>/dev/null; then
        echo "nginx not found. Proceeding to install"
        #installing the software
        if dnf install nginx -y ; then
            echo "nginx installed successfully"
            
        else
            echo "nginx installation failed"
            exit 1
        fi
    else
        echo "nginx already installed on this system"
       
    fi

    #checking if software is already installed"
    if ! rpm -q python3 &>/dev/null; then
        echo "python not found. Proceeding to install"
        #installing the software
        if dnf install python3 -y ; then
            echo "python installed successfully"
           
        else
            echo "python installation failed"
            exit 1
        fi
    else
        echo "python already installed on this system"
       
    fi

fi
echo "all checks complete"
exit 0


