#!/bin/bash

## variables
dir_home=$HOME
dir_src=$dir_home/.src
dir_dots=$dir_home/.dotfiles
dir_suckless=$dir_src/suckless

## update system
sudo pacman -Syyu --noconfirm
 
#Installing Driver and related utilites
sudo pacman -S nvidia nvidia-utils nvidia-settings

## install base packages
sudo pacman -S --noconfirm base-devel libx11 xorg-server xorg xorg-xinit libxinerama yay vim git alacritty picom conky bluez network-manager-applet kdeconnect sxiv zathura mpv moc redshift sxhkd thunar virtualbox obs-studio code telegram-desktop torbrowser-launcher scrot neomutt inkscape lxappearance speedcrunch gedit firefox emacs bitwarden audacity gimp youtube-dl optimus-manager zsh jq pup syncthing curl stow transmission-cli dunst lxsession webkit2gtk mpd

## update AUR packages
yay -Syu

## install from AUR
yay -S artha anydesk-bin rambox safeeyes balena-etcher libxft-bgra lightdm-webkit-theme-aether stremio optimus-manager-qt xmenu betterlockscreen python-pywal otpclient

## persinal scripts
git clone https://github.com/mrbooshehri/scripts.git
git clone https://github.com/mrbooshehri/.dotfiles.git

## reload config files with stow
cd "$dir_dots" || return
stow --adopt -vt ~ * 

## xinit
#echo "exec dwm" > "$dir_home/.xinitrc"

## add x to bash
#echo "startx" >> "$dir_home/bashrc"

## useful tools
mkdir -p "$dir_src"
git clone https://github.com/pystardust/ytfzf.git "$dir_src"
git clone https://github.com/Bugswriter/pirokit.git "$dir_src"
git clone https://github.com/egeesin/alacritty-color-export.git "$dir_src"
git clone https://github.com/GideonWolfe/Zathura-Pywal.git "$dir_src"
git clone https://github.com/agnipau/telegram-palette-gen.git "$dir_src"

## suckless setup
mkdir -p "$dir_suckless"
git clone https://github.com/mrbooshehri/dwm.git "$dir_suckless/dwm"
git clone https://github.com/mrbooshehri/dmenu.git "$dir_suckless/dmenu"
git clone https://github.com/mrbooshehri/st.git "$dir_suckless/st"
git clone https://github.com/mrbooshehri/dwmblocks.git "$dir_suckless/dwmblocks"

## install dwm
cd "$dir_suckless/dwm" || return
sudo make clean install

## install dmenu
cd "$dir_suckless/dmenu" || return
sudo make install

## install st
cd "$dir_suckless/st" || return
sudo make clean install

## install dwmblocks
cd "$dir_suckless/dwmblocks" || return
sudo make clean install

## install oh-my-zh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

## install zsh plugins
#git clone https://github.com/zdharma/fast-syntax-highlighting.git \
#  ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting

#git clone https://github.com/zsh-users/zsh-autosuggestions.git \
#  ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
