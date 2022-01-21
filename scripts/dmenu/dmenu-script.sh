#! /bin/bash
FILE=$(find ~/scripts/* -mindepth 1 | dmenu -l 15)
if [ -n "$FILE" ];then
	alacritty -e vim "$FILE"
fi
