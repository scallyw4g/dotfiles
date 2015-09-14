#!/bin/sh

# Background -- Try setting this first because it's visual
nitrogen --restore &

pulseaudio &

export GDK_SCALE=2
export QT_DEVICE_PIXEL_RATIO=2

export XDG_CONFIG_HOME="$HOME/.config"

export MPD_HOST=127.0.0.1
export MPD_PORT=6600

# Include for lemonbar
export PATH=$PATH:$HOME/.config/lemonbar
export PANEL_FIFO="/tmp/panel-fifo"

# Swap Ctrl and Caps Lock
 setxkbmap -option ctrl:swapcaps

# Set font size for i3 based on value in .Xfontsize
# This sets FONTSIZE variable
source $HOME/.Xfontsize
sed "s/font xft:Hack-Regular/font xft:Hack-Regular $FONTSIZE/g" $HOME/.i3/config > $HOME/.i3/liveconfig

# Set font size for Xresources
echo "#define FONTSIZE $FONTSIZE" > $HOME/.Xresources-fontsize
# And include Xresources
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources &

# start compon
compton -b --config $HOME/.config/compton.conf

# Start MPD
mpd &

# Disable trackpad on keystrokes (Ignoreing modifier keycombos with -K)
syndaemon -d -K -i 0.25

## CONKYS
# get interface we're connected on for conkyi3
# export interface=`ip addr show | ack 'state UP' | awk '{ print $2 }' | sed 's/://'`
# main conky
# conky -c $HOME/.scripts/conky/conkyrc-main &
# gcal conky
# conky -c $HOME/.scripts/conky/conkyrc-gcal &
# Taskwarrior conky
# exec conky -c $HOME/.scripts/conky/conky-taskwarrior &

# Start i3 with the live config generated above
# exec i3 -c $HOME/.i3/liveconfig # start the i3 window manager

# xrandr --output HDMI-0 --auto --left-of eDP-0

sxhkd &
exec bspwm
