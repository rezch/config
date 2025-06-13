#!/bin/bash

DOTCONF_PATH=$HOME/.config
DOTCONF_FOLDERS=(
    "foot"
    "hypr"
    "kitty"
    "nvim"
    "rofi"
    "waybar"
    "waypaper"
    "yazi"
)

HOME_CONFIGS=(
    "vimrc"
    "zshrc"
    "p10k.zsh"
)

DIFF="diff -r \
   --exclude="*.bak" \
   --exclude="*.png""

for folder in "${DOTCONF_FOLDERS[@]}"
do
    if [[ $($DIFF "./dotfiles/$folder" "$DOTCONF_PATH/$folder") ]]; then
        echo "Found diff in $folder"
        rm -rf ./dotfiles/"$folder"
        cp -r "$DOTCONF_PATH/$folder" ./dotfiles
        echo "Copyied"
    fi
done

for file in "${HOME_CONFIGS[@]}"
do
    if [[ $(diff "./home/$file" "$HOME/.$file") ]]; then
        echo "Found diff in $file"
        cp "$HOME/.$file" "./home/$file"
        echo "Copyied"
    fi
done

echo "Fetching done"
