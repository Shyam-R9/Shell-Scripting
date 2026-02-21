#!/bin/bash

#install 3 packages - mysql, nginx, python3

#color codes
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

#check if the user has privilages to install the softwares
if [ $(id -u) -ne 0 ]; then
    echo -e "$R You do not have sudo privilages to install the softwares $N "
    exit 1
fi

#function to check and install a package
install_package() {
    local pkg=$1
    #checking if software is already installed"
    if ! rpm -q "$pkg" &>/dev/null; then
        echo -e "$Y $pkg not found. Proceeding to install $N"
        #installing the software
        if dnf install "$pkg" -y ; then
            echo -e " $G $pkg installed successfully $N"
            
        else
            echo -e " $R $pkg installation failed $N"
            exit 1
        fi
    else
        echo -e "$Y $pkg already installed on this system $N"
    fi
}    


#list of packages
packages=("mysql" "nginx" "python3")

for package in "${packages[@]}"; do
    install_package "$package"
done

echo -e "$G All checks complete $N"
exit 0