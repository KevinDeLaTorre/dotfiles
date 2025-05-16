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
$(set -- ".zshrc" ".bashrc" ".vimrc" ".tmux.conf" ".gitignore_global" ".rubocop.yml" "Brewfile")

for file in "$@"; do
	rsync -aiu "$DOTFILE_DIRECTORY/$file" "$DOTFILE_LOCATION"
done

####################
# NVim
####################

mkdir -p "$CONFIG_DIRECTORY/nvim"
rsync -aiu "$DOTFILE_DIRECTORY/nvim" "$CONFIG_DIRECTORY" --include nvim/
