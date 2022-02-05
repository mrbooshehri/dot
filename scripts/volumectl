#! /bin/bash
maxvol=100
 # for pulseaudio
#vol=$(amixer -c 1 -D pulse sget Master | grep 'Left:' | awk -F '[][]' '{print $2}' | cut -d% -f1)
# for pipwire 
vol=$(pamixer --get-volume)

case $1 in
  -u)
    if [ $vol -lt $maxvol ];then  
      pactl set-sink-volume 0 +5%
    fi
    ;;
  -d) pactl set-sink-volume 0 -5% ;;
esac
