#!/bin/bash

ARR=()
ARR+=("懶 :Play/Pause")
ARR+=("怜 :Next")
ARR+=("玲 :Previous")
ARR+=(" :Vol up")
ARR+=(" :Vol down")

CHOICE=$(printf '%s\n' "${ARR[@]}" | rofi -dmenu -i -p " ")

if [ "$CHOICE" = "懶 :Play/Pause" ]; then
  	mocp -G
	sleep 0.2s
	notify-send -t 3000 "$( mocp -i | awk '/^State/ {print $NF}')" \
	  "$( mocp -i | awk -F "/" '/^File/ {print $NF}'| sed s/.mp3//g)\n$(mocp -i | awk  '/^TimeLeft/ {print $NF}') : $(mocp -i | awk  '/^TotalTime/ {print $NF}')"	
	
	exit 0
fi

if [ "$CHOICE" = "怜 :Next" ]; then
  	mocp -f
	sleep 0.2s
	notify-send -t 3000 "Next" "$( mocp -i | awk -F "/" '/^File/ {print $NF}'| sed s/.mp3//g)"
	exit 0
fi

if [ "$CHOICE" = "玲 :Previous" ]; then
  	mocp -r
	sleep 0.2s
	notify-send -t 3000 "Previous" "$( mocp -i | awk -F "/" '/^File/ {print $NF}'| sed s/.mp3//g)"
	exit 0
fi


if [ "$CHOICE" = " :Vol up" ]; then
  	mocp --volume=+10
	exit 0
fi

if [ "$CHOICE" = " :Vol down" ]; then
  	mocp --volume=-10
	exit 0
fi

