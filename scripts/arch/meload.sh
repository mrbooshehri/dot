#!/bin/bash

## variables
dir_home=$HOME
dir_src=$dir_home/.src
dir_dots=$dir_home/.dotfiles

## install base packages
printf 'Install packages...\n'
sudo pacman -S alacritty picom conky kdeconnect sxiv zathura mpv moc redshift thunar tumbler virtualbox obs-studio telegram-desktop torbrowser-launcher scrot lxappearance speedcrunch gedit emacs bitwarden gimp youtube-dl zsh jq syncthing transmission-cli dunst polkit-gnome nodejs starship npm pamixer playerctl light
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' =

### install from AUR
printf 'Install packages from AUR...\n'
yay -S anydesk-bin safeeyes balena-etcher stremio xmenu betterlockscreen python-pywal otpclient pup matcha-gtk-theme pfetch glow anki #optimus-manager optimus-manager-qt
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' =
## persinal scripts
printf 'Cloning personal repos...\n'
git clone https://github.com/mrbooshehri/.dotfiles.git
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' =

## reload config files with stow
printf 'Restore all config files...\n'
cd "$dir_dots" 
stow -vt ~ $(ls -d */ | grep -v '^bash')
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' =

## xinit
#echo "exec dwm" > "$dir_home/.xinitrc"

## add x to bash
#echo "startx" >> "$dir_home/bashrc"

## useful tools
printf 'Cloning other repos...\n'
mkdir -p "$dir_src"
cd "$dir_src" 
git clone https://github.com/pystardust/ytfzf.git
git clone https://github.com/Bugswriter/pirokit.git
git clone https://github.com/egeesin/alacritty-color-export.git
git clone https://github.com/GideonWolfe/Zathura-Pywal.git
git clone https://github.com/agnipau/telegram-palette-gen.git
mkdir -p "$dir_src/zsh"
cd "$dir_src/zsh" 
git clone https://github.com/zdharma/fast-syntax-highlighting.git
git clone https://github.com/zsh-users/zsh-autosuggestions.git
git clone https://github.com/reegnz/jq-zsh-plugin.git
# Install node packages
#npm install -g spotify-dl
