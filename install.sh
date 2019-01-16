source ~/.dotfiles/helpers.sh

title "Link config files"
link ~/.dotfiles/bash_profile ~/.bash_profile
link ~/.dotfiles/bashrc ~/.bashrc
link ~/.dotfiles/vimrc ~/.vimrc
link ~/.dotfiles/zshrc ~/.zshrc
link ~/.dotfiles/atom/config.cson ~/.atom/config.cson

if [[ $(uname -s) == Darwin ]]
then # macOS
  title "macOS specific install"
  $(~/.dotfiles/macos_install.sh)
else
  ./ubuntu_install
fi

# Change shell to ZSH
chsh -s /bin/zsh

# ========== ATOM ==========

# Mac setup
# Settings Atom -> Install Shell Commands

# Install from dotfile config
# apm install --packages-file ~/.dotfiles/atom/package.list

# Write packages to dotfile config
# apm list --installed --bare > ~/.dotfiles/atom/package.list

# Write atom config to dotfiles
# cat ~/.atom/config.cson > ~/.dotfiles/atom/config.cson

# Link atom/config.cson -> ~/.atom/config.cson

# Miniconda
title "Installing miniconda"
if [[ $(which conda) == "" ]]; then
  wget https://repo.continuum.io/miniconda/Miniconda3-3.7.0-Linux-x86_64.sh -O ~/miniconda.sh
  bash ~/miniconda.sh -b -p $HOME/miniconda
fi
