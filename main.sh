#!/bin/bash
kernel_name=$(uname -s)

echo "Current kernel version"
uname -mrs

echo ""

if  [ $kernel_name == "Linux" ]
then
    echo "Installed kernels"
    if command -v dnf &> /dev/null
    then
        dnf list installed kernel | tail -n +2 | awk '{ print $1 , $2 }'
    elif command -v dpkg &> /dev/null
    then
        dpkg --list | grep linux-image | awk '{ print $2 }'
    fi
elif [ $kernel_name == "FreeBSD" ]
then
    echo "The kernel type is FreeBsd"
fi

#if redhat based distro
rpm -qa kernel
