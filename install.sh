#!/bin/bash
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
if [[ $SHELL -ef $(which zsh) ]]
then
  chsh -s $(which zsh)
fi

title "Install Antibody packages"
$(./antibody/install.sh)

title "Install atom packages"
# apm install doesn't natively support skipping already installed packages
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

# ========== ATOM ==========
# Write packages to dotfile config
# apm list --installed --bare > ~/.dotfiles/atom/package.list
