# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

export TERM=xterm-256color

# Start only a single ssh-agent on login
if [ ! -S ~/.ssh/ssh_auth_sock  ]; then
  eval `ssh-agent`
  ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
ssh-add -l > /dev/null || ssh-add

eval "$(oh-my-posh --init --shell zsh --config ~/.poshthemes/kevin.omp.json)"
# Set colorscheme for terminal

# Start in home directory
# cd ~

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Switch docker socket to colima
export DOCKER_HOST="unix://$HOME/.colima/docker.sock"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"
unsetopt correct

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git rails ruby)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# # Start only a single ssh-agent on login
# if [ ! -S ~/.ssh/ssh_auth_sock  ]; then
#   eval `ssh-agent`
#   ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
# fi
# export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
# ssh-add -l > /dev/null || ssh-add

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
#alias python="python3"
#

export PATH="$HOME/.rbenv/bin:$PATH"
# export PATH="$HOME/.gem/ruby/2.6.0/bin:$PATH" # Sets ruby to 2.6.0
eval "$(rbenv init -)"

# nvm source lines
#export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}"  ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
#[ -s "$NVM_DIR/nvm.sh"  ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export ANDROID_HOME=/Users/kevin.delatorre/Library/Android/sdk

# # Automatically load node version in project if nvmrc is present
# autoload -U add-zsh-hook
# load-nvmrc() {
#  local node_version="$(nvm version)"
#  local nvmrc_path="$(nvm_find_nvmrc)"
#
#  if [ -n "$nvmrc_path"  ]; then
#    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")
#
#    if [ "$nvmrc_node_version" = "N/A"  ]; then
#      nvm install
#    elif [ "$nvmrc_node_version" != "$node_version"  ]; then
#      nvm use
#    fi
#  elif [ "$node_version" != "$(nvm version default)"  ]; then
#    echo "Reverting to nvm default version"
#    nvm use default
#  fi
# }
# add-zsh-hook chpwd load-nvmrc
# load-nvmrc

# zsh aliases
alias sourcezsh="source ~/.zshrc && source ~/.zshenv"

# Rails Aliases
alias be="bundle exec"
alias ber="bundle exec rake"

# Docker functions
alldockervolumes() {
  docker volume ls -qf dangling=true
}

# Docker Aliases
alias dockerconsole="docker-compose run --rm console"
alias dockerreset="dockerdown && dockerkillall && dockerpruneall"
alias dockerresetforce="dockerdown && dockerkillall && dockerpruneallforce"
alias dockerdown="docker-compose down"
alias dockerpruneimages="docker image prune --all"
alias dockerprunesystem="docker system prune"
alias dockerprunevolumes='docker volume rm $(alldockervolumes)'
alias dockerpruneall="dockerprunesystem && dockerpruneimages"
alias dockerpruneallforce="dockerpruneall && dockerprunevolumes"
alias dockerkillall="docker-compose kill"

# Converter
alias mov2gif='ffmpeg -i $1 -r 10 $2 && gifsicle -O3 $2 -o $2'

# Open scratch folder
alias scratch='cd ~/scratch'

####################
# Mac
####################
alias brewupgrade="brew update && brew upgrade"
alias updatenvim="echo 'Updating nvim...' && nvim --headless '+Lazy! sync' +qa"

alias updatecopilot="echo 'Updating CLI copilot...' && gh extension upgrade gh-copilot"
alias updategcloud="gcloud components update --quiet"

alias updateall="updatenvim && updatecopilot && updategcloud && brewupgrade"

####################
# Work
####################
source ~/.zsh/work/.workzsh

####################
# Personal
####################

source ~/.zsh/personal/.zshrc
export PATH="/usr/local/opt/postgresql@13/bin:$PATH"
