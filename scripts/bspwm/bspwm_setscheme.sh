#! /usr/bin/env bash

themes=()
themes+=("dracula")
themes+=("gruvbox-dark")
themes+=("gruvbox-light")
themes+=("nord")
themes+=("solarized-dark")
themes+=("solarized-light")
isDark=1

choice=$(printf "%s\n" "${themes[@]}" | dmenu)
[ -z "$choice" ] && exit 1

case $choice in
  "dracula")
    wal --theme base16-dracula ;;
  "gruvbox-dark")
    wal --theme base16-gruvbox-medium ;;
  "gruvbox-light")
    wal --theme base16-gruvbox-medium -l 
    isDark=0 ;;
  "nord")
    wal --theme base16-nord;;
  "solarized-dark")
    wal --theme base16-solarized ;;
  "solarized-light")
    wal --theme base16-solarized -l
    isDark=0 ;;
esac

bash ~/.src/alacritty-color-export/script.sh
bash ~/.src/Zathura-Pywal/install.sh
bash ~/.src/telegram-palette-gen/telegram-palette-gen --wal

ln -sf ~/.cache/wal/colors.Xresources ~/.Xresources
ln -sf ~/.cache/wal/light_colors.yaml ~/.config/colorls
ln -sf ~/.cache/wal/dark_colors.yaml ~/.config/colorls

## conky
ln -sf ~/.cache/wal/conkyrc ~/.conkyrc
pkill conky
conky &

## dunst
ln -sf ~/.cache/wal/dunstrc ~/.config/dunst/dunstrc



# gtk theme and rofi
file_conf=~/.config/gtk-3.0/settings.ini

sed -i '/gtk-theme-name/d' $file_conf
sed -i '/gtk-icon-theme-name/d' $file_conf

case $isDark in
  0)
    echo "gtk-theme-name=Matcha-light-aliz" >> $file_conf
    echo "gtk-icon-theme-name=deepin" >> $file_conf
    ln -sf ~/.cache/wal/colors-rofi-light.rasi ~/.config/rofi/config.rasi
    ;;
  1)
    echo "gtk-theme-name=Matcha-dark-aliz" >> $file_conf 
    echo "gtk-icon-theme-name=deepin-dark" >> $file_conf
    ln -sf ~/.cache/wal/colors-rofi-dark.rasi ~/.config/rofi/config.rasi
    ;;
esac

# kde theme
file_conf=~/.config/Kvantum/kvantum.kvconfig

sed -i '/theme/d' $file_conf

case $isDark in
  0)
    echo "theme=Matchama-Light-Aliz" >> $file_conf 
    ;;
  1)
    echo "theme=Matchama-Dark-Aliz" >> $file_conf
    ;;
esac

## reload xresources file
xrdb -load ~/.Xresources

pkill dunst
dunst &
pkill polybar
polybar bar &
notify-send "Colorscheme" "[ $choice ] colorscheme selected"

