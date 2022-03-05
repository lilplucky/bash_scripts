#!/usr/bin/env bash


#Creator:The Label
#Date created 1st December 2021
#Last modified:7th December 2021

#This script is under construction
reset="\033[0m"
red_f="\033[31m"
cyan_f="\033[36m"
yellow_f="\033[33m"
magenta_f="\033[35m"
declare -r green_f="\033[32m"
sleep=$(sleep 1)
echo -e "$red_f Starting process killer ...........................................\033[0m"
PID=$1
init(){
declare -i num=1
while (( num < 35 ))
do 
(( num++ ))
echo -ne "$magenta_f + $reset"
sleep 0.01
done
}
init #call


#Unworked with variable
find=$(pidof $1 > ~/.pids)
#simple tasks
#arrange pids in descending mananner
get=$(cat ~/.pids)
echo -e "\nPID: $get"


echo -n > ~/.pids_s
sleep 0.2
for line in `cat ~/.pids |cut -d" " -f1-100 `;

do 
var=$line ;
echo -e "$var" >> ~/.pids_s ;
done    
if [[ -e ~/.pids ]];then
checker=$(ls -al ~/ |grep -i .pids|cut -d " " -f5-30|cut -d " " -f 2-9|awk 'NR=2 {print $1}'|head -1)
if [[ $checker == 0 ]];
then
echo -e $cyan_f
echo -e "No program with such pid was found... $reset $green_f \nQuiting the program..... $reset"
#Deconstructed
##bash "$0" &&get="NULL" 
exit 1
else
echo -e "$green_f Proceeding to kill.. $reset"
fi
fi

for action  in $(cat ~/.pids_s);
do
echo -e "$yellow_f killing $PID with process identity: $action";
sleep 0.4;
kill -9 $action;
sleep 0.3;
done
echo "Done.. 💥 💤💤💤"
echo -e "$magenta_f =========================Quit========================= $reset"
exit 0
