#! /bin/bash
menu=$(printf "Start Recording\nStop Recording"|dmenu)
case $menu in
  "Start Recording") 
	notify-send -u critical -t 1500 "OBS" "Start recording"
  	obs-studio --startrecording
    ;;
  "Stop Recording")
  	killall -s 9 obs
	notify-send -u critical -t 1500 "OBS" "Stop recording"
    ;;
  *)exit ;;
esac 
