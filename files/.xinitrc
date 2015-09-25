#!/bin/bash

# turn on numlock keys
numlockx on

# disable screen blanking (non of them works I think... :( )
xset s off
xset -dpms
xset s noblank

# custom script to fix mouse
setmousespeed

# no more beeping bells
xset -b

# dimm the lights
redshift -l 57:11 -b 0.9 &

# start the WM
exec spectrwm

