#!/bin/sh

# Swap Ctrl and Caps Lock
 setxkbmap -option ctrl:swapcaps 

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources &		# append contents of Xresources
bg_rotate & # rotate bg image  *NOTE this script is set to run in the background (& suffix)

compton  & # start compton in the background


##############  INIT CONKYS
# main conky
conky -c $HOME/.scripts/conkyrc-main &
# gcal conky
conky -c $HOME/.scripts/conkyrc-gcal &
# Taskwarrior conky
exec conky -c ~/.scripts/conky-taskwarrior &

# Remap Caps-lock from xmodmaprc
setxkbmap -option ctrl:nocaps

exec i3 # start the i3 window manager


