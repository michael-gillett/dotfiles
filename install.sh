source ~/.dotfiles/helpers.sh

title "Link config files"
link ~/.dotfiles/bash_profile ~/.bash_profile
link ~/.dotfiles/bashrc ~/.bashrc
link ~/.dotfiles/vimrc ~/.vimrc
link ~/.dotfiles/zshrc ~/.zshrc
link ~/.dotfiles/gitconfig ~/.gitconfig
mkdir ~/.hammerspoon
link ~/.dotfiles/hammerspoon/init.lua ~/.hammerspoon/init.lua
mkdir ~/.atom
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
if [[ $SHELL != $(which zsh) ]]
then
  chsh -s $(which zsh)
fi

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
# title "Installing miniconda"
# if [[ $(which conda) == "" ]]; then
#  curl https://repo.continuum.io/miniconda/Miniconda3-3.7.0-Linux-x86_64.sh -o ~/miniconda.sh
#  bash ~/miniconda.sh -b -p $HOME/miniconda
# fi

title "Installing miniconda"
if [[ $(which conda) == "" ]]; then
  curl https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh -o ~/miniconda.sh
  bash ~/miniconda.sh -b -p $HOME/miniconda
fi
