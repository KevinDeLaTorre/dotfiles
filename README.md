# Setup

- Install Oh-my-zsh
- Install Oh-my-posh
- Install tmux

- Copy all files from dotfiles to your home directory

# NeoVim

- Install NeoVim
  - mac: `brew install neovim`
  - ubuntu:
    ```
    sudo apt-get install software-properties-common
    sudo add-apt-repository ppa:neovim-ppa/unstable
    sudo apt-get update
    sudo apt-get install neovim
    ```
- copy `nvim` folder to `~/.config`
- run neovim with `nvim`
  - on initial run it should install plugins
- run `:checkhealth lazy`

---

# Vim
### Install Vundle (a plugin manager):
```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

### Config

Copy `.vimrc` to user home if you haven't done it already

### Plugin Install

Open vim and run:

```
:PluginInstall
```

Note: This might take a sec, will probably hang on `nerdfonts` (because it's a big download/install)

---

# Tmux

prefix: CTRL+b

### Install tpm (tmux plugin manager):
'''
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
'''

### Install plugins

'''
prefix + 'I'
'''

### Update Plugins

'''
prefix + 'U'
'''

### Remove/Uninstall plugins not in list

'''
prefix + 'alt' + 'u'
'''
