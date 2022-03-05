#!/bin/bash
#Author -: The_Label
#Linux rotator script

#small linux rotate script
labels="/-\|"
#echo ${#labels}
# while :; do
# 	for (( i=0; i<${#labels}; i++ ));do echo -en "${labels:$i:1} \r";sleep 0.5;done

# done

while : 
do
	for (( i=0; i<${#labels}; i++ ))
	do
		echo -en "${labels:$i:1}" "\r"
		sleep 0.5
	done
	


done
