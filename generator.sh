#!/usr/bin/env bash
#This script is under heavy construction
#A script to generate 10 pairs in uppercase of what you input

#Define colors
red="\033[31m"
for letter in "$1" ;do
counter_count=$letter
if [[ -z $counter_count ]]
	then
	echo -e "This script requires TWO argument to run!!"
	echo "You didn't specify letter to generate"
	 echo "Usage: <$0> <letter to generate> [number as argument]"
	echo "Quittting" &&  exit 1
#else
	#echo "Generating..."
#echo "${counter^^}"
fi
done

if [ -z $2 ];then
	echo "Failed to validate second argument..number.."
	echo "Quitting ..."&& exit 1
fi


for generator in  $counter_count;do
 echo "${generator^^}"  
done

