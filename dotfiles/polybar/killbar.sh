# kill script is updated to Version 2.0 with the help of pietryszak(github) idea
# script by phon31x & pietryszak
#! /bin/bash

primary_monitor=$(xrandr --query | grep primary | awk '{print $1}')
pid=$(xprop -name "polybar-tray_$primary_monitor" _NET_WM_PID | grep -o '[[:digit:]]*')
kill $pid
