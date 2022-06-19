#!/bin/sh

# Set correct monitor and resolution
xrandr -q | grep -q "HDMI-2 connected"
if [ $? -eq 0 ]; then
        #echo "connected"
        xrandr --output eDP-1 --off --output HDMI-2 --primary --mode 1920x1080
else
        #echo "disconnected"
        xrandr --output eDP-1 --primary --output HDMI-2 --off
fi

# turn on numlock keys
numlockx on

# disable screen blanking (non of them works I think... :( )
xset s off
xset -dpms
xset s noblank

# disable beeping bells
xset -b

# dimm the lights
redshift -l 57:11 -b 0.9 &

# start the WM (panel, hotkeys, manager)
~/.config/bspwm/panel | lemonbar -g x10 -d -u 0 -a 0 -p &
sxhkd &
exec bspwm

