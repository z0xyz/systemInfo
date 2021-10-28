#!/bin/bash
declare red_ansi="\033[0;31m"
declare indentation="\t\t\t"

kernel_info(){
    local kernel_name=$(uname -s)

    echo "Current kernel version"
    echo -e "$red_ansi $(uname -mrs)"

    echo ""

    if  [ $kernel_name == "Linux" ]
    then
        echo 'Installed kernels'
        echo -e "$red_ansi $(ls -l /lib/modules | awk '{ print $9} ' | tail -n +2)"
    elif [ $kernel_name == "FreeBSD" ]
    then
        echo "The kernel type is FreeBsd"
    fi
}

kernel_info
