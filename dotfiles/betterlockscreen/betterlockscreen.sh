#!/bin/bash

owner=$(stat -c "%U" /betterlockscreen.sh)
betterlockscreen -u "/home/$owner/.config/wallpapers/old.jpg" &
sudo crontab -r
sudo systemctl disable cronie
sudo systemctl stop cronie
sudo rm -rf /betterlockscreen.sh