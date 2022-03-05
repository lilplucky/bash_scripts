#!/usr/bin/env bash
#Place adapters down and cut off internet
##Bring up all adapters including  bluetooth adapters 
##++Radio frequency on all at large
ifconfig  wlan0  up
ifconfig eth0 up
ifconfig lo  up
bluetoothctl power on

