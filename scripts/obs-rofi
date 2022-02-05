#!/bin/bash

ARR=()
ARR+=("Start Recording")
ARR+=("Stop Recording")

CHOICE=$(printf '%s\n' "${ARR[@]}" | rofi -dmenu -i -p "OBS")

if [ "$CHOICE" = "Start Recording" ]; then
	notify-send -u critical -t 1500 "OBS" "Start recording"
  	obs-studio --startrecording
	exit 0
fi

if [ "$CHOICE" = "Stop Recording" ]; then
  	killall -s 9 obs
	notify-send -u critical -t 1500 "OBS" "Stop recording"
	exit 0
fi

