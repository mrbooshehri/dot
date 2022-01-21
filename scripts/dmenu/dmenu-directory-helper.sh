#! /bin/bash
choice=$(echo -e "/home\n/mnt" | dmenu -p "Select path: ")

[ -z "$choice" ] && exit 1

case $choice in
  "/home") 
    dir_home=$HOME
    select=$(find $dir_home -maxdepth 3 -type d 2>/dev/null | cut -d "/" -f 4- | tail -n +2 | sort | dmenu -l 15)
    [ -z "$select" ] && exit 1
    thunar "$dir_home/$select"
    ;;
  "/mnt") 
    dir_home=/mnt/1TB
    select=$(find $dir_home -maxdepth 3 -type d 2>/dev/null | cut -d "/" -f 4- | tail -n +2 | sort | dmenu -l 15) 
    [ -z "$select" ] && exit 1
    thunar "$dir_home/$select"
    ;;
  *)
    [[ -d $choice ]] && dir_home="$choice" || notify-send "Directory Helper" "Invalid path"
    select=$(find $dir_home -maxdepth 3 -type d 2>/dev/null | tail -n +2 | sort | dmenu -l 15) 
    [ -z "$select" ] && exit 1
    thunar "$select"
    ;;
esac
