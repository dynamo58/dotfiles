#!/usr/bin/bash


# Wrap for commands to be executed independently
# of the process and also to be run as the caller
function run() {
    nohup runuser -u $(logname) -- $@  > /dev/null 2>&1 &
}

# setup panel
killall xfce4-panel > /dev/null 2>&1
killall polybar > /dev/null 2>&1

run polybar --config=/home/$(logname)/.config/polybar/config.ini main

# enable scrolling via middle mouse button
xinput set-prop $(xinput list "pointer:Logitech G305" | grep id= | cut -d=   -f2 | awk '{print $1}') "libinput Scroll Method Enabled" 0, 0, 1

# setup hdd
mount /dev/sdb1 /hdd

# initiate keybind listener
xbindkeys -f $HOME/.xbindkeysrc

# set wallpapers
xwallpaper --zoom /home/$(logname)/.config/wall.jpg --output HDMI-8 --output HDMI-1-2
