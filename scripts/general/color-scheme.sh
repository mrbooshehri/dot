#                _                     _          _          _ 
#               | |                   | |        | |        (_)
# _ __ ___  _ __| |__   ___   ___  ___| |__   ___| |__  _ __ _ 
#| '_ ` _ \| '__| '_ \ / _ \ / _ \/ __| '_ \ / _ \ '_ \| '__| |
#| | | | | | |  | |_) | (_) | (_) \__ \ | | |  __/ | | | |  | |
#|_| |_| |_|_|  |_.__/ \___/ \___/|___/_| |_|\___|_| |_|_|  |_|

#! /bin/bash
wal -i /mnt/1TB/Pictures/Wallpaper.repo/$(ls /mnt/1TB/Pictures/Wallpaper.repo | shuf | head -1)

## intialization
dwmc xrdb
bash ~/.src/alacritty-color-export/script.sh
bash ~/.src/Zathura-Pywal/install.sh
bash ~/.src/telegram-palette-gen/telegram-palette-gen --wal
ln -sf ~/.cache/wal/colors-rofi-dark.rasi ~/.config/rofi/config
ln -sf ~/.cache/wal/Xresources  ~/.Xresources
ln -sf ~/.cache/wal/light_colors.yaml ~/.config/colorls
ln -sf ~/.cache/wal/dark_colors.yaml ~/.config/colorls

## conky
ln -sf ~/.cache/wal/conkyrc ~/.conkyrc
pkill conky
conky &

## dunst
ln -sf ~/.cache/wal/dunstrc ~/.config/dunst/dunstrc
pkill dunst
dunst &
