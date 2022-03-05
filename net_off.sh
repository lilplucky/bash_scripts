#!/usr/bin/env bash
#Place adapters down and cut off internet
ifconfig  wlan0 down
ifconfig eth0 down
ifconfig lo  down
