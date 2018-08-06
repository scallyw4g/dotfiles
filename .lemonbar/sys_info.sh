#!/usr/bin/zsh

GREEN=%{F#FF77CD66}
ORANGE=%{F#FFF09B00}
RED=%{F#FFFF4443}
GREY=%{F#FF839496}
HI_WHITE=%{F#FFF1F1F1}
LO_WHITE=%{F#FFE1E1E1}

DELIM="%{F#FFFF00FF}-%{F-}"

# Define the clock
clock()
{
  DATE=$(date "+%b %d %R")
  echo -n "$HI_WHITE$DATE%{F-}"
}

battery()
{
  acpi > /dev/null 2>&1 || exit 0

  chargeState=$(acpi -b | awk '{ print $3}' | sed 's/,//g')
  batteryPerc=$(acpi -b | awk '{ print $4 }' | sed 's/%,*//g ')
  color=$GREEN

  # Don't print anything if battery is above 98
  [ $batteryPerc -gt 98 ] && exit 1

  # If plugged in, show the charge in green, otherwise:
  if [ "$chargeState" = "Discharging" ]; then
    [ $batteryPerc -lt 75 ] && color=$ORANGE
    [ $batteryPerc -lt 20 ] && color=$RED
  fi

  # Change the output to a FA icon
  case $batteryPerc in
    9[0123456789]) icon="\uf240"
    ;;

    [87][0123456789]) icon="\uf241"
    ;;

    [65][0123456789]) icon="\uf242"
    ;;

    [432][0123456789]) icon="\uf243"
    ;;

    [1][0123456789]) icon="\uf244"
    ;;

    [0123456789]) icon="\uf244"
    ;;
  esac

  echo -n $color$icon%{F-}
}

mpd()
{
  curSong=$(basename "$(mpc current -f "%artist% - %title%")" )
  mpcStatus=$(mpc status | sed -n 2p | awk '{ print $1 }')
  mpcVol=$(mpc volume | awk '{ print $2 }')

  case $mpcStatus in
    "[paused]")
      color=$ORANGE
      textColor=$GREY
      ;;
    "[playing]")
      color=$GREEN
      textColor=$LO_WHITE
      ;;
  esac

  if [ -z "$curSong" ]; then
    echo -n "Stopped"
  else
    echo -n "$mpcVol $color\uf001 $textColor$curSong%{F-}"

  fi
}

network()
{
  # Get address
  icon="\uF1EB"
  color=$GREEN
  addr=$(hostname -i)

  ping -c 1 8.8.8.8 > /dev/null 2>&1
  if [[ $? -ne 0 ]]; then
    icon=""
    addr=""
    color=""
  fi

  echo "$color$icon $HI_WHITE$addr"
}

updates()
{
  cat /tmp/numupdates

  # Update the package count evey 5 minutes
  [ $((timer % 600)) -ne 0 ] && exit 0

  numUpdates=$(checkupdates | wc -l)

  [ $numUpdates -gt 9 ] && color=$ORANGE
  [ $numUpdates -gt 19 ] && color=$RED


  echo -n $numUpdates $color"\uf187"%{F-} > /tmp/numupdates
}

timer=0

while true; do
  buf="S"

  funcs=("network" "updates" "clock" "battery")

  for fun in $funcs; do

    tempOut=$($fun)
    # If the last command failed break this iteration
    [ $? -gt 0 ] && continue;

    buf="$buf  $DELIM  $tempOut"
  done

  echo "$buf  "

  timer=$((timer+1))

sleep 1
done
