#!/usr/bin/env bash

# name		icon
# light		

light=$(light -G | cut -d '.' -f 1)
icon=""


~/scripts/dunst/notify-send.sh -r  "$(pgrep dunst)" "$icon  $light"

