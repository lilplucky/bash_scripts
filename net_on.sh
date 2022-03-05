#!/usr/bin/env bash
#Place adapters down and cut off internet
ifconfig  wlan0  up
ifconfig eth0 up
ifconfig lo  up
