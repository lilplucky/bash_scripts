#!/bin/bash
##figlet -w 150 -c  MAC_BABY


#Check if sudo mode
if [[ $EUID -ne 0 ]];then
	printf "This script must be run as root !!.. Try with sudo ..\n"
	exit 1
fi



main_banner(){


	cat << "eof"
					    _         _    ___        __  __                   __  __  ___      _      
					   / \  _   _| |_ / _ \      |  \/  | ___  _ __       |  \/  |/ _ \  __| | ___ 
					  / _ \| | | | __| | | |_____| |\/| |/ _ \| '_ \ _____| |\/| | | | |/ _` |/ _ \
					 / ___ \ |_| | |_| |_| |_____| |  | | (_) | | | |_____| |  | | |_| | (_| |  __/
					/_/   \_\__,_|\__|\___/      |_|  |_|\___/|_| |_|     |_|  |_|\___/ \__,_|\___|
					                                                                               
eof
}
main_banner

#edits  by  author 
ulinered="\033[4;31;40m"
red="\033[31;40m"
none="\033[0m"
# echo -e "\t\t\t\t\t$red This  program  requires  the   following optional modules to  run$none"
# echo -e "\t\t\t\t$ulinered 1.figlet $none "
# echo -e "\t\t\t\t\t$ulinered 2.sysvbanner $none"
##Not required anymore
set +x ##Suppress showing command execution
echo  -e "\t\t\tFANCY  TEXT  BY  ANONYMOUS  AUTHOR~^ "
echo  STARTING PROGRAM...
echo putting  the  wireless adapter  down
sudo ifconfig  wlan0  down
#sleep 0
echo  "done....."
echo  "killing  processes  that could  cause  trouble" 
echo "Killing  networking  service"
sudo /etc/init.d/networking  stop
#sleep 0
echo "Killing network-manager  service"
sudo service NetworkManager  stop
#sleep 0
echo "killing tor service"
sudo /etc/init.d/tor  stop
#sleep 0
echo "additional airmon-ng  halt services"
#airmon-ng check kill
killall wpa_supplicant
#sleep 0
echo "done..stopping network-manager   &  networking  services "
echo "putting down the  adapter  again"
echo "CHECKING FOR MAC ANONYMITY IDENTITY!!"
echo  changing  mac......  to  random  mac  
#sudo macchanger  -r  wlan0
#appended from maccanger script
#sleep 0
# figlet -w 150 -c ANON-CHECK...
##anon check abanner

anon_check_banner(){
cat << "anon_check"
					    _    _   _  ___  _   _        ____ _   _ _____ ____ _  __      
					   / \  | \ | |/ _ \| \ | |      / ___| | | | ____/ ___| |/ /      
					  / _ \ |  \| | | | |  \| |_____| |   | |_| |  _|| |   | ' /       
					 / ___ \| |\  | |_| | |\  |_____| |___|  _  | |__| |___| . \ _ _ _ 
					/_/   \_\_| \_|\___/|_| \_|      \____|_| |_|_____\____|_|\_(_|_|_)
					                                                                   
anon_check

}
anon_check_banner #call



enable_anon_banner(){
#create banner
cat << "enable_non"
			 _____ _   _    _    ____  _     _____        _    _   _  ___  _   _   _ 
			|___ /| \ | |  / \  | __ )| |   | ____|      / \  | \ | |/ _ \| \ | | | |
			  |_ \|  \| | / _ \ |  _ \| |   |  _|       / _ \ |  \| | | | |  \| | | |
			 ___) | |\  |/ ___ \| |_) | |___| |___     / ___ \| |\  | |_| | |\  | |_|
			|____/|_| \_/_/   \_\____/|_____|_____|___/_/   \_\_| \_|\___/|_| \_| (_)
			                                     |_____|                             
enable_non
}


anon_exist_banner(){
cat << "anon_exist"
					    _    _   _  ___  _   _      _______  _____ ____ _____ 
					   / \  | \ | |/ _ \| \ | |    |___ /\ \/ /_ _/ ___|_   _|
					  / _ \ |  \| | | | |  \| |_____ |_ \ \  / | |\___ \ | |  
					 / ___ \| |\  | |_| | |\  |_____|__) |/  \ | | ___) || |  
					/_/   \_\_| \_|\___/|_| \_|    |____//_/\_\___|____/ |_|  
					                                                          
anon_exist
}


macchanger -s  wlan0   >  mac-test.txt
#ifon   variable  for  future  use  and  dispense 

#ifon="$(cat  mac-test.txt)"
com1=$(grep  Current mac-test.txt | awk 'NR=2 {print $3}' )
com2=$(grep  Permanent mac-test.txt | awk 'NR=2 {print $3}' )


if [[ ${com1} = ${com2} ]] ;then 
	ifconfig  wlan0  down
	echo  -e "RISKY -: MAC  WAS  SAME- : - changing  mac . . ."
	# figlet -w 150 -c "ENABLE-ANON!!" 
	enable_anon_banner
	#sleep  0.1s 	
	#sleep 2s
macchanger  -r  wlan0
	
	ifconfig  wlan0 up
	anon_mac=$(macchanger  -s  wlan0)
	echo "Done  changing  mac"
	#sleep 1.5
	#sleep  0.2s 
	echo "At $(date +%H-%M-%S)" > /home/quod/Desktop/new-anon-mode.txt
	echo  "Anon  mode  was   disabled,now  up:" >> /home/quod/Desktop/new-anon-mode.txt

	echo  "New  anon-mac  is ${anon_mac} "  >> /home/quod/Desktop/new-anon-mode.txt
	cp /home/quod/Desktop/new-anon-mode.txt /root/Desktop/

elif  [[ $com1 != $com2 ]] ;then 
	anon_exist_banner
	echo "Anon mode is  enabled,running   and up" > /home/quod/Desktop/anon-mode.txt
	already_anon_mac="$(macchanger  -s  wlan0)"

	echo  "Anon-mac  is :${already_anon_mac}" >> /home/quod/Desktop/anon-mode.txt
	cp /home/quod/Desktop/anon-mode.txt /root/Desktop/

fi

# figlet -w 150 -c ANON-MODE-EXIST  --


echo  "quiting  bye.."
echo  "done...."
echo    the  new  mac is  show below
sudo macchanger -s  wlan0 
echo  enabling  monitor  mode  on wlan0......
sudo iwconfig  wlan0 mode  monitor
echo  "ok use  the  adapter as  wlan0" 
echo    ">>>>>>.....done"
echo  "bringinging  the  adapter  up"
#sleep 1
sudo ifconfig  wlan0  up
echo "done ....Quiting"
echo  "BYE.>>>>>>>>>>>>>>>>"
echo  "sleeping  to  quit"
#sleep 1

###Quiting banner
sysbanner(){
cat << "sysbanner"
 #####  #     #   ###   #######   ###   #     #  #####
#     # #     #    #       #       #    ##    # #     #
#     # #     #    #       #       #    # #   # #
#     # #     #    #       #       #    #  #  # #  ####
#   # # #     #    #       #       #    #   # # #     #   ###     ###     ###
#    #  #     #    #       #       #    #    ## #     #   ###     ###     ###
 #### #  #####    ###      #      ###   #     #  #####    ###     ###     ###
sysbanner
}
sysbanner #call

#start  airodump-ng to capture networks around
airodump-ng wlan0
