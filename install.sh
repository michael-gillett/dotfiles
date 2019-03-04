source ~/.dotfiles/helpers.sh

title "Link config files"
link ~/.dotfiles/bash_profile ~/.bash_profile
link ~/.dotfiles/bashrc ~/.bashrc
link ~/.dotfiles/vimrc ~/.vimrc
link ~/.dotfiles/zshrc ~/.zshrc
link ~/.dotfiles/atom/config.cson ~/.atom/config.cson
link ~/.dotfiles/gitconfig ~/.gitconfig
link ~/.dotfiles/hammerspoon/init.lua ~/.hammerspoon/init.lua
link ~/.dotfiles/atom/config.cson ~/.atom/config.cson

if [[ $(uname -s) == Darwin ]]
then # macOS
  title "macOS specific install"
  $(~/.dotfiles/macos_install.sh)
elif [[ $(uname -s) == Linux ]]
then
  title "Linux specific install"
  $(~/.dotfiles/ubuntu_install.sh)
fi

# Change shell to ZSH
chsh -s $(which zsh)

# ========== ATOM ==========

# Mac setup
# Settings Atom -> Install Shell Commands

# Install from dotfile config
# apm install --packages-file ~/.dotfiles/atom/package.list

# Write packages to dotfile config
# apm list --installed --bare > ~/.dotfiles/atom/package.list

# Write atom config to dotfiles
# cat ~/.atom/config.cson > ~/.dotfiles/atom/config.cson

# Miniconda
title "Installing miniconda"
if [[ $(which conda) == "" ]]; then
  wget https://repo.continuum.io/miniconda/Miniconda3-3.7.0-Linux-x86_64.sh -O ~/miniconda.sh
  bash ~/miniconda.sh -b -p $HOME/miniconda
fi
