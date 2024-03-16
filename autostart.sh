# setup panel
killall xfce4-panel > /dev/null 2>&1
killall polybar > /dev/null 2>&1

polybar --config=$HOME/.config/polybar/config.ini main &!

# enable scrolling via middle mouse button
xinput set-prop $(xinput list "pointer:Logitech G305" | grep id= | cut -d=   -f2 | awk '{print $1}') "libinput Scroll Method Enabled" 0, 0, 1

# setup hdd
sudo mount /dev/sdb1 /hdd

# initiate keybind listener
xbindkeys -f /home/smolik/.config/.xbindkeysrc

# set wallpapers
xwallpaper --zoom /home/smolik/.config/wallpaper --output HDMI-0 --output DP-0

espanso