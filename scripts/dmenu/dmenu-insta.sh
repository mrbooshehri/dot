#! /bin/bash
#                _                     _          _          _ 
#               | |                   | |        | |        (_)
# _ __ ___  _ __| |__   ___   ___  ___| |__   ___| |__  _ __ _ 
#| '_ ` _ \| '__| '_ \ / _ \ / _ \/ __| '_ \ / _ \ '_ \| '__| |
#| | | | | | |  | |_) | (_) | (_) \__ \ | | |  __/ | | | |  | |
#|_| |_| |_|_|  |_.__/ \___/ \___/|___/_| |_|\___|_| |_|_|  |_|
ARR=()
ARR+=("video.italiani")
ARR+=("comment_gap")
ARR+=("top_mixx")
ARR+=("aziz.mhmdi")
ARR+=("persian_americans")

CHOICE=$(printf '%s\n' "${ARR[@]}" | dmenu)

dir_tmp=/tmp/instatmp

mkdir -p $dir_tmp

instaloader --login lglitchyl --dirname-pattern $dir_tmp


