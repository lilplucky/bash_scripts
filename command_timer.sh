#!/bin/bash
#Author -: QuodVide
#Creation Date -: 28-12-2021
#Last Modified -: 28-12-2021
#Part of pass_tweak script resource

##take  two inputs minutes  and seconds and start count down

##Color definitions
declare -r reset_f="\033[0m"
declare -r green_f="\033[32m"
declare -r black_f="\033[30m"
declare -r  yellow_f="\033[33m"
declare -r magenta_f="\033[35m"
declare -r white_f="\033[37m"
declare -r dim="\033[2m"
declare -r italic="\033[3m"
declare -r underline="\033[4m"
declare -r red_f="\033[31m"
declare -r reset="\033[0m"



banner(){
echo -e  $yellow_f 
cat << "EOF"

																	
			 _     _                  _____ _                     
			| |   (_)_ __  _   ___  _|_   _(_)_ __ ___   ___ _ __ 				
			| |   | | '_ \| | | \ \/ / | | | | '_ ` _ \ / _ \ '__|
			| |___| | | | | |_| |>  <  | | | | | | | | |  __/ |   
			|_____|_|_| |_|\__,_/_/\_\ |_| |_|_| |_| |_|\___|_|   
					                                                      
		****************************************************************
		* Copyright of 	Quod Vide, 2021                                *
		* https://www.github.com/3mili@no445                           *
		* https://www.youtube.com/nameless_boy_                        *
		****************************************************************

																					
EOF
echo -e "$reset"
}


#All inputs set only ready for count down 
calculate(){
if [[ $total_time -eq 0 ]];then printf "Time entered "$red_f"0000000000000"$reset_f"\n"$italic"Nothing to count\n";exit 0;fi
declare -i  acc=$total_time #Local variable
##find half
declare -i half_time=$(( total_time / 2 )) #will only be read at the start 
while [[ $acc -gt 0 ]] ;do
	# printf "Time remaining in seconds: $total_time\n "
	#New total time
	acc=$(( $acc - 1 )) #Arithmetic expansion
	printf "$red_f"
	printf "Time remaining in seconds:--> $white_f%s\r$reset_f" "[ $acc ]"
	printf "$reset_f"
	sleep 1 #To count one second gone
	#Alert when its half time
	while [[ $acc -eq $half_time ]];do 
		printf ""$magenta_f"Half of the time is gone"$reset"\n";
		printf "Checking for any commands issued to execute . . . \n";
	if [[ -z $command_exec_half_time ]];then
		printf "No command issued\n"
		 # printf "Command found executing $red_f $command_exec_half_time $reset_f\n";
	else 
		printf "Executing command $red_f%s\n$reset" "$command_exec_half_time"
		 $command_exec_half_time 
		# printf "No command issued command found\n"; ##command was found
	fi
	break 
	done #Break after one cycle of this check
	while [[ $acc -eq 0 ]];do 
			printf $red_f"\nTime is up !\n"$reset"";
			printf "Checking if there is command instruction to execute...\n"
			if [[ -z $command_exec ]];then 
				printf "No command issued\n";exit 0;
			 else
																							
				printf "Executing command $red_f%s\n$reset" "$command_exec";fi
				##Execute that command
				$command_exec
	break
	done
done
# while [[ $acc -eq $half_time ]];do printf "Half of the time is gone\n";done
echo #BAck to shell 
}

write_cmd(){
command_exec="" #Initial is blank
command_exec_half_time="" #initial is blank
#when_exec=""
read -p "Execute command at what time ? [Half time/ Full time [Default is full time. Select 'h' or 'f' or 'q' to bypass this and go to counter]]: -->> " when_exec

if [[ -z $when_exec ]];then calculate; #answer=no;
elif [[ $when_exec == q  ]];then calculate #Direct to counter section
elif [[  $when_exec == h||   $when_exec == H ||   $when_exec == f ||   $when_exec == F ]];then 
	ans_do=$when_exec; #set this variable to reference answer
	if [[ $ans_do == h ||  $ans_do == H ]];then 
							read -p  "Type command to be executed at [Half Time]  and hit enter: " command_exec_half_time 
							calculate
						elif  [[ $ans_do == f || $ans_do == F ]];
						then
							 read -p  "Type command to be executed at Full time and hit enter: " command_exec;
							 calculate ;
						
						fi
else
							echo -e "$magenta_f"
							 printf "Invalid  answer please repeat or press q to bypass this prompt!\n";
							 write_cmd;
							 echo -e $reset_f


fi



# elif [[ $when_exec != 1	 ||	$when_exec != 2 || $when_exec != q ]];then 
# 	printf "Invalid option ..\n";
# 	write_cmd
# elif [[ $when_exec -eq q ]];then calculate #Bypass this feature
# elif [[ $when_exec -eq 1 || $when_exec -eq 2 ]];then do_exec=$when_exec
# 	if [[ $do_exec -eq 1 ]];then 
# 		read -p  "Type command to be executed at [Half Time]  and hit enter: " command_exec_half_time 
# 		calculate 
# 	elif [[ $do_exec -eq 2 ]];then 
# 		read -p  "Type command to be executed and hit enter: " command_exec
# 		calculate 
# 	fi


# fi
# read -p  "Type command to be executed and hit enter: " command_exec
# calculate #Count time and perfom action


}

action(){
answer=""
read -p "Do wish to run a command when time is up? Y/N or press q to bypass this prompt  [Default is No] " answer
if [[ -z $answer ]];then calculate; #answer=no;
elif [[ $answer == q  ]];then calculate #Direct to counter section
elif [[ $answer == Y||  $answer == y ||  $answer == n ||  $answer == N ]];then 
	answer_do=$answer;if [[ $answer_do == Y || $answer_do == y ]];then 
							write_cmd; #function input command
						elif  [[ $answer_do == N || $answer_do == n ]];
						then echo "Fine .. Proceeding ..";calculate ;else printf "Invalid  answer please repeat or press q to bypass this prompt!\n";action;fi


fi


}


##seconds function
minutes(){
#Initial as blank
local min=""
printf "$yellow_f"
read -p "Enter number of minutes or enter q to quit [Blank defaults to 0 minutes]: -->> " min #If input is null  then minutes is zero
 printf "$reset_f"
if [[ -z $min ]];then min=0 #Must set this to integer zero if its empty
elif [[ -n $min ]];then	if [[ $min == q ]];then exit 0;fi; if [[ ! $min =~ ^[+-]?[0-9]{1,9}+$ ]]; then
		#statements
		printf "Wrong inputs.Minutes can only be an integer number \n"
		minutes #call back function
	fi
fi
count_min=$min #Global var
}

##seconds function
seconds(){
#Initial as blank
local sec=""
printf "$green_f"
read -p "Enter number of seconds or enter q to quit [Blank defaults to 0 seconds]: -->> " sec #If no input is given seconds will be zero
printf "$reset_f"
if [[ -z $sec ]];then sec=0
elif  [[ -n $sec ]];then  if [[ $sec == q ]];then exit 0;fi 
	if [[ ! $sec =~ ^[+-]?[0-9]{1,9}+$ ]]; then
		#statements
		printf "Wrong inputs.Seconds can only be an integer number \n"
		seconds #call back function
	fi
fi
count_sec=$sec #Global var
##convert from here otherwise they will not be available
##convert minutes to seconds
final_minutes=$(( count_min * 60 ))
##final seconds remain same state
final_seconds=$count_sec

##calculate total time added
total_time=$(( $final_minutes + $final_seconds ))

}
#Init
banner
##Call minutes and seconds functions respectively
minutes
seconds
action
##All is set now call this to start timer
# calculate #get to this function based on conditions y/n Y/N