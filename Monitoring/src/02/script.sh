#!/bin/bash


    echo "HOSTNAME = $(hostname)"  
    echo "TIMEZONE = $(cat /etc/timezone) $(date -u "+%Z") $(date "+%z")" 
    echo "USER = $(whoami)" 
    echo -n "OS = $(awk '{print($3, $2)}' /etc/issue)" 
    echo "DATE = $(date | awk '{print($3, $2, $6, $4)}')" 
    echo "UPTIME = $(uptime -p)" 
    echo "UPTIME SEC = $(awk '{print($1)}' /proc/uptime)" 
    echo "IP = $(hostname -i)" 
    echo "MASK = $(ifconfig | grep -m1 inet | awk '{print($4)}')" 
    echo "GATEWAY = $(ip route | grep default | awk '{print $4}')"  
    echo "RAM TOTAL = $(free -m | grep Mem | awk '{printf "%.3f", $2/1024 }')"  
    echo "RAM USED = $(free -m | grep Mem | awk '{printf "%.3f", $3/1024 }')"  
    echo "RAM FREE = $(free -m | grep Mem | awk '{printf "%.3f", $4/1024 }')"  
    echo "SPACE ROOT = $(df | grep '/$' | awk '{printf "%.2f", $2/1024}')"  
    echo "SPACE ROOT USED = $(df | grep '/$' | awk '{printf "%.2f", $3/1024}')"  
    echo "SPACE ROOT FREE = $(df | grep '/$' | awk '{printf "%.2f", $4/1024}')" 

