#!/bin/sh
# shellcheck disable=SC2086
# shellcheck disable=SC3020

COPY_TO_LOCAL_SCRIPT="update_local_from_git.sh"

####################
# Installs
####################

command_exists() {
	if
		command -v $1 >/dev/null
	then
		return 0
	else
		return 1
	fi
}

dir_exists() {
	if [ -d "$(realpath ~)/$1" ]; then
		return 0
	else
		return 1
	fi
}

program_exists() {
	if
		which $1 >/dev/null
	then
		return 0
	else
		return 1
	fi
}

run_copy_to_local_script() {
	sh "./$COPY_TO_LOCAL_SCRIPT"
	make_missing_dirs
}

install_main_programs() {
	# package managers + os specific
	OS="$(uname)"
	case $OS in
	'Linux')
		OS='Linux'
		if ! command_exists sudo; then
			echo "=== running apt-get install without sudo (because sudo not installed) ==="

			apt-get install sudo build-essential procps curl file git
		else
			echo "=== installing necessary packages ==="
			sudo apt-get install build-essential procps curl file git
		fi

		if ! command_exists brew; then
			echo "=== installing brew ==="
			NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

			test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
			test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
			test -r ~/.bash_profile && echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >>~/.bash_profile
			echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >>~/.profile
		fi

		if ! program_exists oh-my-posh; then
			echo "=== installing oh-my-posh ==="
			brew install jandedobbeleer/oh-my-posh/oh-my-posh
		fi

		if ! program_exists tmux; then
			echo "=== installing tmux ==="
			brew install tmux
		fi

		if ! program_exists nvim; then
			echo "=== installing nvim ==="
			brew install neovim
		fi

		install_all_plugins

		echo "=== copying dotfiles and config files to local ==="
		run_copy_to_local_script

		install_all_plugins

		echo "=== brew update + upgrade ==="
		brew update
		brew upgrade
		;;
	'Darwin')
		OS='Mac'
		if ! command_exists brew; then
			echo "=== installing brew ==="
			NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
		fi

		if ! program_exists oh-my-posh; then
			echo "=== installing oh-my-posh ==="
			brew install jandedobbeleer/oh-my-posh/oh-my-posh
		fi

		if ! program_exists tmux; then
			echo "=== installing tmux ==="
			brew install tmux
		fi

		if ! program_exists nvim; then
			echo "=== installing nvim ==="
			brew install neovim
		fi

		install_all_plugins

		echo "=== copying dotfiles and config files to local ==="
		run_copy_to_local_script

		install_all_plugins

		echo "=== brew update + upgrade ==="
		brew update
		brew upgrade
		;;
	*) ;;
	esac
}

# Oh-my-zsh
install_oh_my_zsh() {
	if ! dir_exists ".oh-my-zsh"; then
		echo "=== installing oh-my-zsh ==="
		sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	fi
}

# Vundle.vim
install_vim_plugins() {
	if ! dir_exists ".vim/bundle/Vundle.vim"; then
		echo "=== installing vim plugins ==="
		git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
		vim -c ":PluginInstall" -c ":qa"
	else
		echo "=== updating vim plugins ==="
		vim -c ":PluginUpdate" -c ":qa"
	fi
}

# NvChad
install_nvim_plugins() {
	if ! dir_exists ".config/nvim"; then
		echo "=== installing nvchad ==="
		git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
	fi

	echo "=== installing/updating nvim plugins ==="
	nvim --headless +PackerSync +qa
}

# Tmux
install_tmux_plugins() {
	if ! dir_exists ".tmux/plugins/tpm"; then
		echo "=== installing tmux plugins ==="
		git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

		#   install the plugins
		sh ~/.tmux/plugins/tpm/scripts/install_plugins.sh
	else
		echo "=== updating tmux plugins ==="

		# update all plugins
		sh ~/.tmux/plugins/tpm/scripts/update_plugin.sh all
	fi
}

make_missing_dirs() {
	echo "=== creating missing directories ==="
	mkdir -p ~/.zsh/personal ~/.zsh/work ~/.zsh/scripts
}

install_all_plugins() {
	echo "=== installing all plugins ==="
	install_vim_plugins
	install_nvim_plugins
	install_tmux_plugins
}

install_main_programs
