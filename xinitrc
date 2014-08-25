#!/bin/bash
#
# Executed by startx (run your window manager from here)

# merge in defaults and keymaps
#userresources=$HOME/.Xresources
#usermodmap=$HOME/.Xmodmap
#sysresources=/etc/X11/xinit/.Xresources
#sysmodmap=/etc/X11/xinit/.Xmodmap
#if [ -f $sysresources ]; then
#    /usr/bin/xrdb -merge $sysresources
#fi
#if [ -f $sysmodmap ]; then
#    /usr/bin/xmodmap $sysmodmap
#fi
#if [ -f $userresources ]; then
#    /usr/bin/xrdb -merge $userresources
#fi
#if [ -f $usermodmap ]; then
#    /usr/bin/xmodmap $usermodmap
#fi

# turn on numlock keys
numlockx on

# disable screen blanking
xset s off
xset -dpms
xset s noblank

# set mouse speed
xset m 1.5

# no more beeping bells
xset -b

# dimm the lights
redshift -l 57:11 -b 0.9 &

# show current time, pacman updates, CPU usage and mpd song
dwmstatus &

# start the WM
exec dwm

