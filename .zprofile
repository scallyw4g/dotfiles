# And include Xresources
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources &

export XDG_CONFIG_HOME="$HOME/.config"

# Swap Ctrl and Caps Lock
setxkbmap -option ctrl:swapcaps

# Fix fucking java
export _JAVA_AWT_WM_NONREPARENTING=1

export MPD_HOST=127.0.0.1
export MPD_PORT=6600

# Include for lemonbar
export PATH="$PATH:$HOME/.lemonbar"
export PANEL_FIFO="/tmp/panel-fifo"

