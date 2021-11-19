#!/bin/bash
declare red_ansi="\033[0;31m"
declare indentation="\t\t\t"

kernel_info(){
    local kernel_name=$(uname -s)

    echo "Current kernel version"
    uname -mrs

    echo

    if  [ $kernel_name == "Linux" ]
    then
        echo 'Installed kernels'
        ls -l /lib/modules | awk '{ print $9} ' | tail -n +2
    elif [ $kernel_name == "FreeBSD" ]
    then
        echo "The kernel type is FreeBsd"
    fi
}

battery_info(){
    local current_battery_status='/sys/class/power_supply/BAT0/charge_full'
    local initial_battery_status='/sys/class/power_supply/BAT0/charge_full_design'
    local battery_percentage="/sys/class/power_supply/BAT0/capacity"
    if [ -e $current_battery_status ] && [ -e $initial_battery_status ] && [ -e $battery_percentage ];then
        local battery_health="$(( $(cat $current_battery_status) / $(cat $initial_battery_status) * 100 ))"
        echo "Battery Health    "$battery_health"%"
        echo "Battery percentage  $(cat $battery_percentage)%"
    fi

}

kernel_info
battery_info
