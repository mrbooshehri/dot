#! /usr/bin/env bash
dir_repo=/mnt/1TB/Pictures/Wallpaper.repo
image=$(find $dir_repo -regextype egrep -regex '.*.(jpg|png)' | shuf | head -1)
feh --bg-fill $image
betterlockscreen -u "$image" 
