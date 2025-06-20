#!/bin/bash

LGREEN="\033[1;32m"
GREEN="\033[0;32m"
RED="\033[0;31m"
NC="\033[0m"

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

DOTCONF_PATH=$HOME/.config
DOTCONF_FOLDERS=(
    "clangd"
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
    "clang-format"
    "p10k.zsh"
    "vimrc"
    "zshrc"
)

DIFF="diff -r \
   --exclude="*.bak" \
   --exclude="*.png""

FILES_DIFF=0
FOLDERS_DIFF=0

for folder in "${DOTCONF_FOLDERS[@]}"
do
    if [[ ! -d "$DOTCONF_PATH/$folder" ]]; then
        echo -e "${RED}Cannot find folder: $DOTCONF_PATH/$folder ${NC}"
        continue
    fi
    if [[ ! -d "$SCRIPT_DIR/dotfiles/$folder" ]]; then
        echo -e "${LGREEN}New folder $DOTCONF_PATH/$folder ${NC}"
        mkdir -p "$SCRIPT_DIR/dotfiles/$folder" 
    fi
    if [[ $($DIFF "$SCRIPT_DIR/dotfiles/$folder" "$DOTCONF_PATH/$folder") ]]; then
        echo "Found diff in $folder"
        rm -rf "$SCRIPT_DIR/dotfiles/$folder"
        cp -r "$DOTCONF_PATH/$folder" "$SCRIPT_DIR/dotfiles"
        echo "Copyied"
        ((FOLDERS_DIFF++))
    fi
done

for file in "${HOME_CONFIGS[@]}"
do
    if [[ ! -f "$HOME/.$file" ]]; then
        echo -e "${RED}Cannot find file: $HOME/.$file ${NC}"
        continue
    fi
    if [[ ! -f "$SCRIPT_DIR/home/$file" ]]; then
        echo -e "${LGREEN}New file $SCRIPT_DIR/home/$file ${NC}"
        touch "$SCRIPT_DIR/home/$file" 
    fi
    if [[ $(diff "$SCRIPT_DIR/home/$file" "$HOME/.$file") ]]; then
        echo "Found diff in $file"
        cp "$HOME/.$file" "$SCRIPT_DIR/home/$file"
        echo "Copyied"
        ((FILES_DIFF++))
    fi
done

if [[ $((${FOLDERS_DIFF} + ${FILES_DIFF})) ]]; then
    echo -e "${GREEN}Fetching done${NC}"
    echo "Updated $FOLDERS_DIFF folders in dotfiles"
    echo "Updated $FILES_DIFF files in home"
else
    echo "Nothing new to fetch..."
fi
