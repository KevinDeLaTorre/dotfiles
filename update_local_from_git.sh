#!/bin/sh

####################
# General locations
####################
DOTFILE_DIRECTORY=$(realpath ~/dotfiles)
CONFIG_DIRECTORY=$(realpath ~/.config)

####################
# Home directory dotfiles
####################

DOTFILE_LOCATION=$(realpath ~) 
DOTFILES=(".zshrc" ".bashrc" ".vimrc" ".tmux.conf")

for file in ${DOTFILES[@]}; do
	rsync -aiu "$DOTFILE_DIRECTORY/$file" "$DOTFILE_LOCATION" 
done

####################
# NVim
####################

mkdir -p "$CONFIG_DIRECTORY/nvim/lua/custom";
rsync -aiu "$DOTFILE_DIRECTORY/nvim/lua/custom" "$CONFIG_DIRECTORY/nvim/lua" --include custom/
