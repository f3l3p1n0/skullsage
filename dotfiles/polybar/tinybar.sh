# script to Tiny-launch polybar

#!/usr/bin/env bash

#!/bin/bash

primary_monitor=$(xrandr --query | grep primary | awk '{print $1}')

pid=$(xprop -name "polybar-tray_$primary_monitor" _NET_WM_PID | grep -o '[[:digit:]]*')

if [ -n "$pid" ]; then
  kill $pid
else
  echo "---" | tee -a /tmp/polybar2.log
  polybar tray >> /tmp/polybar2.log 2>&1
fi

