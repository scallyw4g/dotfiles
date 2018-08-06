!/bin/sh

# Background -- Try setting this first because it's visual
nitrogen --restore &

pulseaudio &

# export GDK_SCALE=2
# export QT_DEVICE_PIXEL_RATIO=2


# start compon
compton -Cfb --config $HOME/.config/compton.conf

# Start MPD
# mpd &

# Disable trackpad on keystrokes (Ignoreing modifier keycombos with -K)
syndaemon -d -K -i 0.25

# xrandr --output HDMI-0 --auto --left-of eDP-0

sxhkd -c ~/.sxhkdrc &

exec bspwm -c ~/.bspwmrc
