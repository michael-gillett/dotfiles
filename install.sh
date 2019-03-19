#!/bin/bash
source ~/.dotfiles/helpers.sh

title "Link config files"
ln -sf ~/.dotfiles/bash_profile ~/.bash_profile
ln -sf ~/.dotfiles/bashrc ~/.bashrc
ln -sf ~/.dotfiles/vimrc ~/.vimrc
ln -sf ~/.dotfiles/zshrc ~/.zshrc
ln -sf ~/.dotfiles/gitconfig ~/.gitconfig
mkdir -p ~/.hammerspoon
ln -sf ~/.dotfiles/hammerspoon/init.lua ~/.hammerspoon/init.lua
mkdir -p ~/.atom
ln -sf ~/.dotfiles/atom/config.cson ~/.atom/config.cson

if [[ $(uname -s) == Darwin ]]
then # macOS
  title "macOS specific install"
  sh ~/.dotfiles/macos_install.sh
elif [[ $(uname -s) == Linux ]]
then
  title "Linux specific install"
  $(~/.dotfiles/ubuntu_install.sh)
fi

# Change shell to ZSH
if [[ $SHELL -ef $(which zsh) ]]
then
  chsh -s $(which zsh)
fi

title "Install Antibody packages"
sh ./antibody/install.sh

title "Install atom packages"
# apm install doesn't natively support skipping already installed packages
# NOTE: Write apm packages to dotfile config
# apm list --installed --bare > ~/.dotfiles/atom/package.list
for package_and_version in `cat ~/.dotfiles/atom/package.list`;
do
  # Strip the version number off the end of the package
  package=${package_and_version%@*}
  if [[ ! -d "$HOME/.atom/packages/$package" ]]
  then
    apm install $package
  fi
done

title "Done :)"
