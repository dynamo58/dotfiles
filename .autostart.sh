#!/usr/bin/bash


# Wrap for commands to be executed independently
# of the process and also to be run as the caller
function run() {
    nohup runuser -u $(logname) -- $@  > /dev/null 2>&1 &
}

# setup panel
killall xfce4-panel
killall polybar
run polybar --config=/home/$(logname)/.config/polybar/config main

# enable scrolling via middle mouse button
xinput set-prop $(xinput list "pointer:Logitech G305" | grep id= | cut -d=   -f2 | awk '{print $1}') "libinput Scroll Method Enabled" 0, 0, 1 &

# setup hdd
mount /dev/sdb1 /hdd &

xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorHDMI-1-2/workspace0/last-image -s /hdd/data/fotky/tapety/red_star.png
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorHDMI-3/workspace0/last-image -s /hdd/data/fotky/tapety/b3592b0702998592368d3b4d4c45878382.jpg

# initiate keybind listener
# xbindkeys -f /home/$(logname)/.xbindkeysrc &

