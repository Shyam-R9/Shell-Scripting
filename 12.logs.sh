#!/bin/bash
#install packages
# colour code

R="\e[31m" G="\e[32m" Y="\e[33m" N="\e[0m"

#setup log file
LOG_FOLDER="/var/log/shell scripting"
SCRIPT_NAME=$(basename "$0" | cut -d "." f1)
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME.log"
mkdir -p "$LOG_FOLDER"

echo -e "$Y Script execution started at: $(date)" | tee -a "log_file"

#Check if the user has privileges to install the packages
if [ $(id -u) -ne 0 ]; then
    echo -e "$R You don't have privileges to install the packages $N" | tee -a "log_file"
fi

install_pkg() {
    local pkg=$1
    if ! rpm -q $pkg &>/dev/null; then
        echo -e "$Y $pkg is not found on this system. Proceeding to install $N" | tee -a "log_file"
        if dnf install "$pkg" -y ; then
            echo -e "$G $pkg installed successfully $N" | tee -a "log_file"
        else
            echo-e "$R $pkg failed to install $N" | tee -a "log_file"
        fi
    else
        echo -e "$Y $pkg already available on this system $N" | tee -a "log_file"
    fi
}
packages=("mysql" "nginx" "python3")

for package in "${packages[@]}"; do
    install_pkg "$package"
done

echo -e "$Y All checks completed $N" | tee -a "log_file"
exit 0
