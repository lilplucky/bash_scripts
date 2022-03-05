#!/bin/bash
#upload  files scripts helper
##color
declare  reset_f="\033[0m"
declare  green_f="\033[32m"
declare black_f="\033[30m"
declare yellow_f="\033[33m"
declare magenta_f="\033[35m"
declare white_f="\033[37m"
declare  dim="\033[2m"
declare italic="\033[3m"
declare  underline="\033[4m"
declare red_f="\033[31m"
declare reset="\033[0m"

echo -en $magenta_f
##empty arg check
if [[ $# -eq 0 ]];then
	printf "Zero arguments supplied .. \n";
	printf "Use the --help or -h option for help info about this tool..\n";exit 1
fi
##Servers array
servers=("bashupload.com" "transfer.sh")
##End server array
##Start help
help_info(){
cat << "eof"
[Commandline options]
-s
[--server]
//Server to use.Do < upload  > --list servers or -l to list all available servers 
that you can use
-f
[--file] 
//File name to upload
-h
[--help]
//This help menu
-l
[--list-servers]
//List all available servers you can use for file transfer
eof
}
##End help
##show server
show_servers(){
printf "Listing servers ...\n"
echo -e "${servers[@]}"
}
##End show server

while getopts :s:f:"l"h opt 
do
  case $opt in
	 s)if [[ $OPTARG -eq 1 ]];then 
					sn="${servers[1]}";
	 			elif [[ $OPTARG -eq 2 ]];then 
	 				sn="${servers[2]}";
	 			# elif [[ ! $OPTARG ]];then sn="${servers[1]}"
	 			else printf "Invalid server option supplied\nQUITING !!!";exit 1 ;fi;;
	f)fn="$OPTARG";;
	h)help_info;exit 0;;
	l)show_servers;exit 0;;
	*)printf "Invalid switch supplied . !\nQUITING ...!\n";exit 1;
  esac
done
##End take input

echo -e $green_f
##upload proc start
#upload files start server select
if [[ $sn == "${servers[1]}" ]];then
	printf "Starting upload process ...!\n"
	curl bashupload.com -T $fn
elif [[ $sn == "${servers[2]}" ]]; then
	#statements
	printf "Starting upload process ...!\n"
	curl --upload-file "$fn" https://transfer.sh/"$fn"
fi
echo -e $reset_f