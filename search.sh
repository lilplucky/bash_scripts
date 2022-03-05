#!/bin/bash


argument="${1}"
#check_if_path=$(grep '/' $argument)
# grep '/' "${argument}"
echo "${argument}" |grep '/'
# echo $?
if [[ $? -eq 0 ]]; then
	#statements
	argument_path=`echo "$argument" | rev |cut -d '/' -f 2-100 | rev`
	search_string=`echo "$argument" | rev | cut -d '/' -f 1 |rev`
	printf "Searching for all files containing $search_string in directory $argument_path\n"
	find "${argument_path}" -type f,d -iname "*$search_string*" 2>/dev/null
else
	#Normal search Current dir pwd
	printf "Searching for all files containing $argument in Current directory. \n"
	find ./ -type f,d -iname "*$argument*" 2>/dev/null
	# echo "Solving  for one argument"

fi