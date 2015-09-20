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

# And include Xresources
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources &

# start compon
compton -b --config $HOME/.config/compton.conf

# Start MPD
mpd &

# Disable trackpad on keystrokes (Ignoreing modifier keycombos with -K)
syndaemon -d -K -i 0.25

xrandr --output HDMI-0 --auto --left-of eDP-0

sxhkd &
exec bspwm
