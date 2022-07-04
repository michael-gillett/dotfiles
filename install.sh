#! /bin/sh

. "./helpers.sh"

title "Link config files"
ln -sf $(pwd)/vimrc ~/.vimrc
ln -sf $(pwd)/zshrc ~/.zshrc
ln -sf $(pwd)/plugins ~/.zsh/plugins
ln -sf $(pwd)/gitconfig ~/.gitconfig
ln -sf $(pwd)/com.local.KeyRemapping.plist ~/Library/LaunchAgents/com.local.KeyRemapping.plist
mkdir -p ~/.hammerspoon
ln -sf $(pwd)/hammerspoon/init.lua ~/.hammerspoon/init.lua
mkdir -p ~/.zsh/cache

if [ "$(uname -s)" = Darwin ]
then # macOS
  title "macOS specific install"
  sh ./macos_install.sh
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


title "Done :)"
