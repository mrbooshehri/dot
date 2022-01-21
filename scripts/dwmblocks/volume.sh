#!/bin/bash

# for pulseaudio
#VOL=$(amixer -c 1 -D pulse sget Master | grep 'Left:' | awk -F '[][]' '{print $2}')
#STAT=$(amixer -c 1 -D pulse sget Master | grep 'Left:' | awk -F '[][]' '{print $4}')
# for pipwire
VOL=$(pamixer --get-volume)
STAT=$(pamixer --get-mute)
case $STAT in 
# for pulseaudio
#  off)
# for pipwire
  true)
	echo " ${VOL}"
    ;;
# for pulseaudio
#  on)
# for pipwire
  false)
    if [ $VOL == "0" ]
    then
	echo " ${VOL}" 
    else
	echo " ${VOL}" 
    fi
    ;;
esac
