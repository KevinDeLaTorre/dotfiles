#!/bin/sh
# shellcheck disable=SC2086
# shellcheck disable=SC3020

COPY_TO_LOCAL_SCRIPT="copy_git_to_local.sh"

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
			echo "=== running apt-get install -y without sudo (because sudo not installed) ==="

			apt-get install -y zsh sudo wget build-essential procps curl file git rsync vim
		else
			echo "=== installing necessary packages ==="
			sudo apt-get install -y zsh wget build-essential procps curl file git rsync vim
		fi

		if ! program_exists oh-my-posh; then
			echo "=== installing oh-my-posh ==="

			sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
			sudo chmod +x /usr/local/bin/oh-my-posh

			mkdir ~/.poshthemes
			wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O ~/.poshthemes/themes.zip
			unzip ~/.poshthemes/themes.zip -d ~/.poshthemes
			chmod u+rw ~/.poshthemes/*.omp.*
			rm ~/.poshthemes/themes.zip
		fi

		if ! program_exists vim; then
			echo "=== installing vim ==="
			sudo apt-get update
			sudo apt-get install -y vim
		fi

		if ! program_exists tmux; then
			echo "=== installing tmux ==="
			sudo apt-get update
			sudo apt-get install -y tmux
		fi

		if ! program_exists nvim; then
			echo "=== installing nvim ==="
			sudo apt install neovim
		fi

		install_all_plugins

		echo "=== copying dotfiles and config files to local ==="
		run_copy_to_local_script

		install_all_plugins

		echo "=== apt-get update + upgrade ==="
		sudo apt-get update
		sudo apt-get upgrade
		;;
	'Darwin')
		OS='Mac'
		if ! command_exists brew; then
			echo "=== installing brew ==="
			NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
		fi

		if ! command_exists rsync; then
			echo "=== installing brew ==="
			brew install rsync
		fi

		if ! program_exists oh-my-posh; then
			echo "=== installing oh-my-posh ==="
			brew install jandedobbeleer/oh-my-posh/oh-my-posh
		fi

		if ! program_exists tmux; then
			echo "=== installing tmux ==="
			brew install tmux
		fi

		if ! program_exists vim; then
			echo "=== installing vim ==="
			brew install vim
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
	install_oh_my_zsh
	install_vim_plugins
	install_nvim_plugins
	install_tmux_plugins
}

install_main_programs
