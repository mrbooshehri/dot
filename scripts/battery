# /bin/bash

CHARGE=$(cat /sys/class/power_supply/BAT0/capacity)
STATUS=$(cat /sys/class/power_supply/BAT0/status)

if [ "$STATUS" = "Charging" ]; then
    printf "%s%%%s" " $CHARGE" #"$STATUS"
else
    printf "%s%%%s" " $CHARGE" #"$STATUS"
fi
