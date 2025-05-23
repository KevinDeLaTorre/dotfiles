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
DOTFILES=(".zshrc" ".bashrc" ".vimrc" ".tmux.conf" ".gitignore_global" ".rubocop.yml" "Brewfile")

for file in ${DOTFILES[@]}; do
	rsync -aiu "$DOTFILE_LOCATION/$file" "$DOTFILE_DIRECTORY"
done

####################
# NVim
####################
NVIM_DIRECTORY=$(realpath "$CONFIG_DIRECTORY"/nvim)
NVIM_DOTFILES_CUSTOM_DIRECTORY="$DOTFILE_DIRECTORY"

mkdir -p "$NVIM_DOTFILES_CUSTOM_DIRECTORY"; # In case folder doesn't exist
rsync -aiu "$NVIM_DIRECTORY" "$NVIM_DOTFILES_CUSTOM_DIRECTORY" --include nvim/
