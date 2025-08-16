#!/bin/bash

LGREEN="\033[1;32m"
GREEN="\033[0;32m"
LRED="\033[1;31m"
RED="\033[0;31m"
LPURPLE="\033[1;35m"
NC="\033[0m"

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

DOTCONF_PATH=$HOME/.config
DOTCONF_RESULT_PATH=$SCRIPT_DIR/dotfiles
DOTCONF_FOLDERS=(
    "clangd"
    "foot"
    "hypr"
    "kitty"
    "nekoray/config"
    "nvim"
    "rofi"
    "waybar"
    "waypaper"
    "yazi"
)

HOME_RESULT_PATH=$SCRIPT_DIR/home
HOME_CONFIGS=(
    "clang-format"
    "p10k.zsh"
    "vimrc"
    "zshrc"
)

EXCLUDE=(
    "*/profiles/*"
    "*/dashboard/index.html"
    "*.png"
    "*.bak"
)

DIFF="diff -r \
   --exclude="*.bak" \
   --exclude="*.png""

FILES_DIFF=0
FOLDERS_DIFF=0

set -ea

[[ $DEBUG ]] && set -x

for folder in "${DOTCONF_FOLDERS[@]}"
do
    if [[ ! -d "$DOTCONF_PATH/$folder" ]]; then
        echo -e "${RED}Cannot find folder: $DOTCONF_PATH/$folder ${NC}"
        continue
    fi
    if [[ ! -d "$DOTCONF_RESULT_PATH/$folder" ]]; then
        echo -e "${LGREEN}New folder $DOTCONF_PATH/$folder ${NC}"
        mkdir -p "$DOTCONF_RESULT_PATH/$folder"
    fi
    if [[ $($DIFF "$DOTCONF_RESULT_PATH/$folder" "$DOTCONF_PATH/$folder") ]]; then
        echo "Found diff in $folder"
        rm -rf "$DOTCONF_RESULT_PATH/$folder"
        cp -r "$DOTCONF_PATH/$folder" "$DOTCONF_RESULT_PATH/$( dirname $folder )"
        echo "Copyied"
        FOLDERS_DIFF=$(( FOLDERS_DIFF + 1 ))
    fi
done

for file in "${HOME_CONFIGS[@]}"
do
    if [[ ! -f "$HOME/.$file" ]]; then
        echo -e "${RED}Cannot find file: $HOME/.$file ${NC}"
        continue
    fi
    if [[ ! -f "$HOME_RESULT_PATH/$file" ]]; then
        echo -e "${LGREEN}New file $HOME_RESULT_PATH/$file ${NC}"
        touch "$HOME_RESULT_PATH/$file"
    fi
    if [[ $(diff "$HOME_RESULT_PATH/$file" "$HOME/.$file") ]]; then
        echo "Found diff in $file"
        cp "$HOME/.$file" "$HOME_RESULT_PATH/$file"
        echo "Copyied"
        ((FILES_DIFF++))
    fi
done

function remove_excess() {
    echo -e "Removing $@"
    rm -rf "$@"
}

for entity in "${EXCLUDE[@]}"
do
    find . -path "$entity" -exec bash -c 'remove_excess "$0"' {} \;
done

if [[ $((${FOLDERS_DIFF} + ${FILES_DIFF})) > 0 ]]; then
    echo -e "${GREEN}Fetching done${NC}"
    echo "Updated $FOLDERS_DIFF folders in dotfiles"
    echo "Updated $FILES_DIFF files in home"
else
    echo -e "${LPURPLE}Nothing new to fetch...${NC}"
fi
