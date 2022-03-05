#!/usr/bin/env bash
#Place adapters down and cut off internet
#++ include bluetooth adapters  down
#radio frequency off all at most
ifconfig  wlan0 down
ifconfig eth0 down
ifconfig lo  down
bluetoothctl power off
