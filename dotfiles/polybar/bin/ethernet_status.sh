#!/bin/sh

echo "%{F#2495e7} %{F#ebdbb2}$(ip addr show dev $(ip route | grep default | awk '{print $5}') | grep "inet " | awk '{print $2}' | cut -d "/" -f 1)%{u-}"
