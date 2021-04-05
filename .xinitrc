#!/bin/bash

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

# start the WM (hotkeys, panel, manager)
sxhkd &
~/.config/bspwm/panel | lemonbar -g x10 -d -u 0 -a 0 -p &
exec bspwm

