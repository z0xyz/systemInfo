#!/bin/bash
kernel_name=$(uname -s)

echo "Current kernel version"
uname -mrs

echo ""

if  [ $kernel_name == "Linux" ]
then
    echo "Installed kernels" 
    ls -l /lib/modules | awk '{ print $9} ' | tail -n +2
elif [ $kernel_name == "FreeBSD" ]
then
    echo "The kernel type is FreeBsd"
fi
