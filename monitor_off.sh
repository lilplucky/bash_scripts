#!/bin/bash 
#airodump-ng wlan0&
#sleep 2s
#pid=`pidof airodump-ng`
#kill -9 $pid
echo "built with power"
echo  "starting  program"
figlet -w 150 -c  MAC_REBOOT
echo  "putting  the wireless  adapter  down"
ifconfig  wlan0  down
echo  "resetting  adapter  to  default managed mode"
iwconfig  wlan0 mode  managed 
echo  "starting necessary  services"
echo "Starting the  networking  service" 
/etc/init.d/networking  restart 
echo "Starting  the  network-manager  service"
echo "Starting  the  tor relay service"
/etc/init.d/tor  start 
service NetworkManager  restart 
echo  ".................DONE"
#echo  "assignining  new  mac ....random"
#macchanger -r wlan0
#appended from maccanger script
figlet -w 150 -c ANON-CHECK...

macchanger -s  wlan0   >  mac-test.txt
#ifon   variable  for  future  use  and  dispense 

#ifon="$(cat  mac-test.txt)"
com1=$(grep  Current mac-test.txt | awk 'NR=2 {print $3}' )
com2=$(grep  Permanent mac-test.txt | awk 'NR=2 {print $3}' )


if [[ ${com1} = ${com2} ]] ;then 
	ifconfig  wlan0  down
	echo  -w 120 -c ":RISKY:MAC  WAS  SAME:--changing  mac"
	figlet -w 150 -c "ENABLE-ANON!!" 
	sleep  0.1s 	
macchanger  -r  wlan0
	
	ifconfig  wlan0 up
	anon_mac=$(macchanger  -s  wlan0)
	echo "Done  changing  mac"
	sleep  0.2s 
	echo "At $(date +%H-%M-%S)" > /home/quod/Desktop/new-anon-mode.txt
	echo  "Anon  mode  was   disabled,now  up:" >> /home/quod/Desktop/new-anon-mode.txt

	echo  "New  anon-mac  is ${anon_mac} "  >> /home/quod/Desktop/new-anon-mode.txt
	cp /home/quod/Desktop/new-anon-mode.txt /root/Desktop/

elif  [[ $com1 != $com2 ]] ;then 

	echo "Anon mode is  enabled,running   and up" > /home/quod/Desktop/anon-mode.txt
already_anon_mac="$(macchanger  -s  wlan0)"

	echo  "Anon-mac  is :${already_anon_mac}" >> /home/quod/Desktop/anon-mode.txt
	cp /home/quod/Desktop/anon-mode.txt /root/Desktop/

fi

figlet -w 150 -c ANON-MODE-EXIST  --
echo  "quiting  bye.."

echo  "the  new  mac  is  shown below"
macchanger  -s  wlan0
echo "DONE..............................."
echo "bringing up  the  adapter  wlan0  to use"
ifconfig  wlan0 up
echo "___________Resolving dns servers_________"
##Uncomment this only if you don't use a dynamic resolv.conf  file to resolve names
##cd /scripts && ./resolve-reset.sh
echo  "DONE"
echo  "QUITIN..................................."
#sleep 1s
sysvbanner  BYE

