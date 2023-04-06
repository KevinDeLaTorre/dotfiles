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
	echo "== Install main programs =="
	OS="$(uname)"
	case $OS in
	'Linux')
		OS='Linux'
		if ! command_exists sudo; then
			echo "|===> running apt-get install -y without sudo (because sudo not installed)\c"

			apt-get install -y zsh sudo wget build-essential procps curl file git rsync vim
			echo " - Done"
		else
			echo "|===> Installing necessary packages\c"
			sudo apt-get install -y zsh wget build-essential procps curl file git rsync vim
			echo " - Done"
		fi

		if ! program_exists oh-my-posh; then
			echo "|===> Installing oh-my-posh\c"

			sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
			sudo chmod +x /usr/local/bin/oh-my-posh

			mkdir ~/.poshthemes
			wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O ~/.poshthemes/themes.zip
			unzip ~/.poshthemes/themes.zip -d ~/.poshthemes
			chmod u+rw ~/.poshthemes/*.omp.*
			rm ~/.poshthemes/themes.zip
			echo " - Done"
		fi

		if ! program_exists vim; then
			echo "|===> Installing vim\c"
			sudo apt-get update
			sudo apt-get install -y vim
			echo " - Done"
		fi

		if ! program_exists tmux; then
			echo "|===> Installing tmux\c"
			sudo apt-get update
			sudo apt-get install -y tmux
			echo " - Done"
		fi

		if ! program_exists nvim; then
			echo "|===> Installing nvim\c"
			sudo apt install neovim
			echo " - Done"
		fi

		echo "|===> Copying dotfiles and config files to local\c"
		run_copy_to_local_script
		echo " - Done"

		install_all_plugins

		echo "\n== Update/Upgrade system =="
		sudo apt-get update
		sudo apt-get upgrade
		echo "\n\nDone"
		;;
	'Darwin')
		OS='Mac'
		if ! command_exists brew; then
			echo "|===> Installing brew\c"
			NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
			echo " - Done"
		fi

		if ! command_exists rsync; then
			echo "|===> Installing brew\c"
			brew install rsync
			echo " - Done"
		fi

		if ! program_exists oh-my-posh; then
			echo "|===> Installing oh-my-posh\c"
			brew install jandedobbeleer/oh-my-posh/oh-my-posh
			echo " - Done"
		fi

		if ! program_exists tmux; then
			echo "|===> Installing tmux\c"
			brew install tmux
			echo " - Done"
		fi

		if ! program_exists vim; then
			echo "|===> Installing vim\c"
			brew install vim
			echo " - Done"
		fi

		if ! program_exists nvim; then
			echo "|===> Installing nvim\c"
			brew install neovim
			echo " - Done"
		fi

		echo "|===> Copying dotfiles and config files to local\c"
		run_copy_to_local_script
		echo " - Done"

		install_all_plugins

		echo "\n== Update/Upgrade system =="
		brew update
		brew upgrade
		echo "Done"
		;;
	*) ;;
	esac
}

# Oh-my-zsh
install_oh_my_zsh() {
	if ! dir_exists ".oh-my-zsh"; then
		echo "|----> Installing oh-my-zsh\c"
		sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
		echo " - Done"
	fi
}

# Vundle.vim
install_vim_plugins() {
	if ! dir_exists ".vim/bundle/Vundle.vim"; then
		echo "|----> Installing vim plugins\c"
		git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
		vim -c ":PluginInstall" -c ":qa"
		echo " - Done"
	else
		echo "|----> Updating vim plugins\c"
		vim -c ":PluginUpdate" -c ":qa"
		echo " - Done"
	fi
}

# NvChad
install_nvim_plugins() {
	if ! dir_exists ".config/nvim"; then
		echo "|----> Installing nvchad\c"
		git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
		echo " - Done"
	fi

	echo "|----> Installing/Updating nvim plugins\c"
	nvim --headless +PackerSync +qa
	echo " - Done"
}

# Tmux
install_tmux_plugins() {
	if ! dir_exists ".tmux/plugins/tpm"; then
		echo "|----> Installing tmux plugins\c"
		git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

		#   install the plugins
		sh ~/.tmux/plugins/tpm/scripts/install_plugins.sh
		echo " - Done"
	else
		echo "|----> Updating tmux plugins\c"

		# update all plugins
		sh ~/.tmux/plugins/tpm/scripts/update_plugin.sh all
		echo " - Done"
	fi
}

make_missing_dirs() {
	mkdir -p ~/.zsh/personal ~/.zsh/work ~/.zsh/scripts
}

install_all_plugins() {
	echo "|===> Installing/Updating all plugins"
	install_oh_my_zsh
	install_vim_plugins
	install_nvim_plugins
	install_tmux_plugins
}

install_main_programs
