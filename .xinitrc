#!/bin/sh

# Set correct monitor and resolution
if [ "$(sysctl -n dev.acpi_dock.0.status)" -eq "1" ]; then
        # Docked, set primary monitor to the bigger ext. screen
        xrandr --output LVDS-1 --off --output HDMI-2 --primary --mode 1920x1080 --pos 0x0
else
        # Undocked (not really needed but eh)
        xrandr --output LVDS-1 --primary --mode 1280x800 --pos 0x0 --output HDMI-2 --off
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

# start the WM (hotkeys, panel, manager)
sxhkd &
~/.config/bspwm/panel | lemonbar -g x10 -d -u 0 -a 0 -p &
exec bspwm

