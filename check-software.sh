#!/bin/bash

echo "This is a script for checking packages"

pkg=$(dpkg-query -s $1) # $1 is the input software name

echo $pkg > output.txt

if grep -q "install ok installed" output.txt; then
    printf "$1 is installed\n"
else
    printf "\n$1 is not installed! installing $1 now\n\n"
    package=$2 # $2 is the package name for example ./check-software.sh nmcli network-manager (nmcli software name and network-manager is the package name)
    sudo apt install -y $2
    printf "$2 has been installed\n"
fi
