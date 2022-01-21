#! /bin/bash
# Get ZSH pluggins
mkdir -P $ZSH_PLUGINS

git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git $ZSH_PLUGINS
git clone https://github.com/reegnz/jq-zsh-plugin.git $ZSH_PLUGINS
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_PLUGINS

clonerepo https://github.com/GideonWolfe/Zathura-Pywal
clonerepo https://github.com/agnipau/telegram-palette-gen
clonerepo https://github.com/vinceliuice/grub2-themes
