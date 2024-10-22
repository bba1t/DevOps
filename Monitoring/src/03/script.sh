#!/bin/bash

HOSTNAME="$(hostname)"  
TIMEZONE="$(cat /etc/timezone) $(date -u "+%Z") $(date "+%z")" 
USER="$(whoami)" 
OS="$(awk '{print($3, $2)}' /etc/issue)" 
DATE="$(date | awk '{print($3, $2, $6, $4)}')" 
UPTIME="$(uptime -p)" 
UPTIME_SEC="$(awk '{print($1)}' /proc/uptime)" 
IP="$(hostname -i)" 
MASK="$(ifconfig | grep -m1 inet | awk '{print($4)}')" 
GATEWAY="$(ip route | grep default | awk '{print $4}')"  
RAM_TOTAL="$(free -m | grep Mem | awk '{printf "%.3f", $2/1024 }')"  
RAM_USED="$(free -m | grep Mem | awk '{printf "%.3f", $3/1024 }')"  
RAM_FREE="$(free -m | grep Mem | awk '{printf "%.3f", $4/1024 }')"  
SPACE_ROOT="$(df | grep '/$' | awk '{printf "%.2f", $2/1024}')"  
SPACE_ROOT_USED="$(df | grep '/$' | awk '{printf "%.2f", $3/1024}')"  
SPACE_ROOT_FREE="$(df | grep '/$' | awk '{printf "%.2f", $4/1024}')" 



textcolor(){
    case $1 in
        1) echo "\033[37m";;
        2) echo "\033[31m";;
        3) echo "\033[32m";;
        4) echo "\033[34m";;
        5) echo "\033[35m";;
        6) echo "\033[30m";;
    esac
}

backcolor(){
    case $1 in
        1) echo "\033[47m";;
        2) echo "\033[41m";;
        3) echo "\033[42m";;
        4) echo "\033[44m";;
        5) echo "\033[45m";;
        6) echo "\033[40m";;
    esac
}


COLOR_OFF="\033[0m "
back_1=$(backcolor "$1")
text_1=$(textcolor "$2")
back_2=$(backcolor "$3")
text_2=$(textcolor "$4")


echo -e "${text_1}${back_1}HOSTNAME =${COLOR_OFF}${text_2}${back_2}${HOSTNAME}${COLOR_OFF}"
echo -e "${text_1}${back_1}TIMEZONE =${COLOR_OFF}${text_2}${back_2}${TIMEZONE}${COLOR_OFF}"
echo -e "${text_1}${back_1}USER =${COLOR_OFF}${text_2}${back_2}${USER}${COLOR_OFF}"
echo -e -n "${text_1}${back_1}OS =${COLOR_OFF}${text_2}${back_2}${OS}${COLOR_OFF}"
echo -e "${text_1}${back_1}DATE =${COLOR_OFF}${text_2}${back_2}${DATE}${COLOR_OFF}"
echo -e "${text_1}${back_1}UPTIME =${COLOR_OFF}${text_2}${back_2}${UPTIME}${COLOR_OFF}"
echo -e "${text_1}${back_1}UPTIME_SEC =${COLOR_OFF}${text_2}${back_2}${UPTIME_SEC}${COLOR_OFF}"
echo -e "${text_1}${back_1}IP =${COLOR_OFF}${text_2}${back_2}${IP}${COLOR_OFF}"
echo -e "${text_1}${back_1}MASK =${COLOR_OFF}${text_2}${back_2}${MASK}${COLOR_OFF}"
echo -e "${text_1}${back_1}GATEWAY =${COLOR_OFF}${text_2}${back_2}${GATEWAY}${COLOR_OFF}"
echo -e "${text_1}${back_1}RAM_TOTAL =${COLOR_OFF}${text_2}${back_2}${RAM_TOTAL}${COLOR_OFF}"
echo -e "${text_1}${back_1}RAM_USED =${COLOR_OFF}${text_2}${back_2}${RAM_USED}${COLOR_OFF}"
echo -e "${text_1}${back_1}RAM_FREE =${COLOR_OFF}${text_2}${back_2}${RAM_FREE}${COLOR_OFF}"
echo -e "${text_1}${back_1}SPACE_ROOT =${COLOR_OFF}${text_2}${back_2}${SPACE_R1OOT}${COLOR_OFF}"
echo -e "${text_1}${back_1}SPACE_ROOT_USED =${COLOR_OFF}${text_2}${back_2}${SPACE_ROOT_USED}${COLOR_OFF}"
echo -e "${text_1}${back_1}SPACE_ROOT_FREE =${COLOR_OFF} ${text_2}${back_2}${SPACE_ROOT_FREE}${COLOR_OFF}"