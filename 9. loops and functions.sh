#!/bin/bash

#install 3 packages - mysql, nginx, python3

#check if the user has privilages to install the softwares
if [ $(id -u) -ne 0 ]; then
    echo "You do not have sudo privilages to install the softwares"
    exit 1
fi

#function to check and install a package
install_package() {
    local pkg=$1
    #checking if software is already installed"
    if ! rpm -q "$pkg" &>/dev/null; then
        echo "$pkg not found. Proceeding to install"
        #installing the software
        if dnf install "$pkg" -y ; then
            echo "$pkg installed successfully"
            
        else
            echo "$pkg installation failed"
            exit 1
        fi
    else
        echo "$pkg already installed on this system"
    fi
}    

#list of packages
packages=("mysql" "nginx" "python3")

for package in "${packages[@]}"; do
    install_package() "$package"
done

echo "All checks complete"
exit 0


