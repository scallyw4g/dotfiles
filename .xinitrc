#!/bin/sh

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources &		# append contents of Xresources
bg_rotate & 							# rotate bg image  *NOTE this script is set to run in the background (& suffix)
conky &								# start conky in the background
compton  &							# start compton in the background
exec i3								# start the i3 window manager
