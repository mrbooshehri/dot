#!/bin/bash

# Options
aur_helper=true
install_ly=false
install_lightdm=true

# Insall AUR helper
if [[ $aur_helper = true ]]; then
  printf 'Installing yay...\n'
  cd /tmp || echo "Faild to change dir to /tmp"
  git clone https://aur.archlinux.org/yay-git.git
  cd yay-git/;makepkg -si --noconfirm;cd
  printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' =
fi

# Install packages
printf 'Installing packages...\n'
sudo pacman -S webkit2gtk yajl mpd kitty
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' =

if [[ $aur_helper = true ]]; then
  printf 'Installing packages from AUR...\n'
  yay -Syyu 
  yay -S libxft-bgra lightdm-webkit-theme-aether 
  printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' =
fi

# Pull Git repositories and install
printf 'Installing suckless tools...\n'
cd /tmp
repos=( "dmenu" "dwm" "dwmblocks" )
for repo in ${repos[@]}
do
  git clone "https://github.com/mrbooshehri/$repo.git"
  cd $repo;make;sudo make install;cd ..
  printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
done
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' =

# XSessions and dwm.desktop
printf 'Creating dwm.desktop...\n'
if [[ ! -d /usr/share/xsessions ]]; then
  sudo mkdir /usr/share/xsessions
fi

cat > ./temp << "EOF"
[Desktop Entry]
Encoding=UTF-8
Name=Dwm
Comment=Dynamic window manager
Exec=dwm
Icon=dwm
Type=XSession
EOF
sudo cp ./temp /usr/share/xsessions/dwm.desktop;rm ./temp
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' =

# Install lightdm
if [[ $install_lightdm = true ]]; then
  printf 'Installing lightdm...\n'
  sudo pacman -S lightdm lightdm-webkit2-greeter
  sudo systemctl enable lightdm 
  printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' =
fi

# Install ly
if [[ $install_ly = true ]]; then
  printf 'Installing ly display manager...\n'
  git clone https://aur.archlinux.org/ly
  cd ly;makepkg -si
  sudo systemctl enable ly
  printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' =
fi

printf "\e[1;32mDone! you can now reboot.\e[0m\n"
