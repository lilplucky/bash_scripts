#!/usr/bin/env  bash

#Author:Quod  vide #@emiliano445  on  github 
#Date  created:19/6/2021

#Date  modified:19/6/2021

#Description:General  usage  program
#Usage:Run  the  installer  then  type ltweak  in  termina.Make  sure 
#you  are  root  during  the installation  of  this  program
#start  os  set  variables # includes  shell variables  
#color  prefs

red_f="\033[31m"
cyan_f="\033[36m"
declare -r black_f="\033[30m"
declare -r green_f="\033[32m"
yellow_f="\033[33m"
magenta_f="\033[35m"
white_f="\033[37m"
declare -r dim="\033[2m"
italic="\033[3m"
reset="\033[0m"
declare -r underline="\033[4m"
 printf -v logdat_time $(date)
kernel="$(uname  -r)"
pc_name=${HOSTNAME}
arc_type=$HOSTTYPE
def_shell=$SHELL
printf -v loguser $(whoami)
printf -v log_all_users_on "$(w) |cat -"
all_user_acc="$(cat /etc/passwd |grep 100 |wc -l |awk 'NR==1') "
((all_user_acc--)) 
free_mem="$(df -h / |awk 'NR==2 {print $4}') "
shell_ver="$(bash --version |awk 'NR==2')"
#end  of  set  variables 
echo -e   "\033[33mStarting  program......L-tweaks version 1.00\033[0m"
declare -i num=1
init(){
while (( num<100 ))
do
(( num++ ))
echo -en "\033[37m+";sleep 0
#echo -en '+'
sleep 0.02
done
}
#call function
init
echo -e  "\n\033[32m$underline General  System  Information..  $reset $magenta_f Reading  system information.. $reset"


printf "\t $italic $red_f Kernel  version:$kernel\n $reset"
sleep 1
printf  "\t$cyan_f Computer-name:$pc_name\n $reset"
sleep 1
printf  "\t$yellow_f Architecture-type:$arc_type\n $reset"
sleep 1
printf "\t$green_f Logged  on  user:$loguser\n $reset"
printf "\t$yellow_f Current default shell:$def_shell\n $reset"
sleep 1
printf "\t$cyan_f Current bash  version:$shell_ver\n $reset"
printf "\t$green_f All  logged  on users:$log_all_users_on \n  $reset"
sleep 1
printf "\t$cyan_f System  date  and  time:$(date)\n $reset"



printf "\n\t$underline$yellow_f ADDITIONAL  SYSTEM INFORMATION\n  $reset"
printf "\n\t $cyan_f Total Useraccounts on  this computer:$all_user_acc\n $reset"
printf "\t$red_f Available free memory:$free_mem\n   $reset"



#sytem uptime 
echo -e "\t\t\t\t\t\t\tSystem has been up for:`uptime -p`"

#print the current default shell
echo "The current default shell is" `strings  /etc/passwd |grep $USER |awk NR==1 |cut -d":" -f 7`
echo
#print ram and swap usage 
echo -e "\t\t\t\tMemory and ram usage"
echo
free -h

#print running services
echo 
echo "Analysing Running services in the system.. Please wait"
service --status-all |grep "[ + ]" |sed /'-'/d

#Read all parttions in the disk
echo -e "\t\t\t\t\tRunning system processes"
echo -e "\033[37m"
ps aux 
