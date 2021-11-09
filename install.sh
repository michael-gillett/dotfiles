#! /bin/sh

. "./helpers.sh"

title "Link config files"
ln -sf ~/.dotfiles/vimrc ~/.vimrc
ln -sf ~/.dotfiles/zshrc ~/.zshrc
ln -sf ~/.dotfiles/gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/com.local.KeyRemapping.plist ~/Library/LaunchAgents/com.local.KeyRemapping.plist
mkdir -p ~/.hammerspoon
ln -sf ~/.dotfiles/hammerspoon/init.lua ~/.hammerspoon/init.lua
mkdir -p ~/.zsh/cache

if [ "$(uname -s)" = Darwin ]
then # macOS
  title "macOS specific install"
  sh ~/.dotfiles/macos_install.sh
elif [ "$(uname -s)" = Linux ]
then
  title "Linux specific install"
  sh "$HOME/.dotfiles/ubuntu_install.sh"
fi

# Change shell to ZSH
if [ "$SHELL" -ef "$(which zsh)" ]
then
  chsh -s "$(which zsh)"
fi

title "Install Antibody packages"
sh ./antibody/install.sh

title "Done :)"
