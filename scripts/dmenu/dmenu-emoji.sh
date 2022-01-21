#! /usr/bin/env bash

emoji=$(cat ~/scripts/dmenu/emojis.txt | dmenu -p "Emoji picker:")

[ -z "$emoji" ] && exit 1

smiley=$(echo $emoji | cut -d' ' -f1)
echo -n "$smiley" | xsel -bi
notify-send -t 2000 -u low "Emoji" "$smiley copied to the clipboard."
exit 0
