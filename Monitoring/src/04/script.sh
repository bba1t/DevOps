#!/bin/bash

source colors.cfg

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

function backcolor1 {
    if [[ $column1_background == *[1]* ]] 
    then
        var="\033[107m"
    elif [[ $column1_background == *[2]* ]] 
    then
        var="\033[41m"
    elif [[ $column1_background == *[3]* ]] 
    then
        var="\033[42m"
    elif [[ $column1_background == *[4]* ]] 
    then
        var="\033[44m"
    elif [[ $column1_background == *[5]* ]] 
    then
        var="\033[45m"
    elif [[ $column1_background == *[6]* ]] 
    then
        var="\033[40m"
    fi
    echo $var
}


function backcolor2 {
    if [[ $column2_background == *[1]* ]] 
    then
        var="\033[107m"
    elif [[ $column2_background == *[2]* ]] 
    then
        var="\033[41m"
    elif [[ $column2_background == *[3]* ]] 
    then
        var="\033[42m"
    elif [[ $column2_background == *[4]* ]] 
    then
        var="\033[44m"
    elif [[ $column2_background == *[5]* ]] 
    then
        var="\033[45m"
    elif [[ $column2_background == *[6]* ]] 
    then
        var="\033[40m"
    fi
    echo $var
}


function textcolor1 {
    if [[ $column1_font_color == *[1]* ]] 
    then
        var="\033[97m"
    elif [[ $column1_font_color == *[2]* ]] 
    then
        var="\033[31m"
    elif [[ $column1_font_color == *[3]* ]]
    then
        var="\033[32m"
    elif [[ $column1_font_color == *[4]* ]]
    then
        var="\033[34m"
    elif [[ $column1_font_color == *[5]* ]]
    then
        var="\033[35m"
    elif [[ $column1_font_color == *[6]* ]]
    then
        var="\033[30m"
    fi
    echo $var
}



function textcolor2 {
    if [[ $column2_font_color == *[1]* ]] 
    then
        var="\033[97m"
    elif [[ $column2_font_color == *[2]* ]] 
    then
        var="\033[31m"
    elif [[ $column2_font_color == *[3]* ]]
    then
        var="\033[32m"
    elif [[ $column2_font_color == *[4]* ]]
    then
        var="\033[34m"
    elif [[ $column2_font_color == *[5]* ]]
    then
        var="\033[35m"
    elif [[ $column2_font_color == *[6]* ]]
    then
        var="\033[30m"
    fi
    echo $var
}


COLOR_OFF="\033[0m"
back_1=$(backcolor1)
text_1=$(textcolor1)
back_2=$(backcolor2)
text_2=$(textcolor2)





          echo -e "${text_1}${back_1}HOSTNAME = ${COLOR_OFF}${text_2}${back_2}${HOSTNAME}${COLOR_OFF}"
          echo -e "${text_1}${back_1}TIMEZONE = ${COLOR_OFF}${text_2}${back_2}${TIMEZONE}${COLOR_OFF}"
          echo -e "${text_1}${back_1}USER = ${COLOR_OFF}${text_2}${back_2}${USER}${COLOR_OFF}"
          echo -e -n "${text_1}${back_1}OS = ${COLOR_OFF}${text_2}${back_2}${OS}${COLOR_OFF}"
          echo -e "${text_1}${back_1}DATE = ${COLOR_OFF}${text_2}${back_2}${DATE}${COLOR_OFF}"
          echo -e "${text_1}${back_1}UPTIME = ${COLOR_OFF}${text_2}${back_2}${UPTIME}${COLOR_OFF}"
          echo -e "${text_1}${back_1}UPTIME_SEC = ${COLOR_OFF}${text_2}${back_2}${UPTIME_SEC}${COLOR_OFF}"
          echo -e "${text_1}${back_1}IP = ${COLOR_OFF}${text_2}${back_2}${IP}${COLOR_OFF}"
          echo -e "${text_1}${back_1}MASK = ${COLOR_OFF}${text_2}${back_2}${MASK}${COLOR_OFF}"
          echo -e "${text_1}${back_1}GATEWAY = ${COLOR_OFF}${text_2}${back_2}${GATEWAY}${COLOR_OFF}"
          echo -e "${text_1}${back_1}RAM_TOTAL = ${COLOR_OFF}${text_2}${back_2}${RAM_TOTAL}${COLOR_OFF}"
          echo -e "${text_1}${back_1}RAM_USED = ${COLOR_OFF}${text_2}${back_2}${RAM_USED}${COLOR_OFF}"
          echo -e "${text_1}${back_1}RAM_FREE = ${COLOR_OFF}${text_2}${back_2}${RAM_FREE}${COLOR_OFF}"
          echo -e "${text_1}${back_1}SPACE_ROOT = ${COLOR_OFF}${text_2}${back_2}${SPACE_R1OOT}${COLOR_OFF}"
          echo -e "${text_1}${back_1}SPACE_ROOT_USED = ${COLOR_OFF}${text_2}${back_2}${SPACE_ROOT_USED}${COLOR_OFF}"
          echo -e "${text_1}${back_1}SPACE_ROOT_FREE = ${COLOR_OFF} ${text_2}${back_2}${SPACE_ROOT_FREE}${COLOR_OFF}"

echo 
echo "Column 1 background = $column1_background"
echo "Column 1 font color = $column1_font_color"
echo "Column 2 background = $column2_background"
echo "Column 2 font color = $column2_font_color"
