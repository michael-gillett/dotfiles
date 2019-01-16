# Include printing helper functions
source ~/.dotfiles/helpers.sh

sudo apt-get install vim
sudo apt-get install openjdk-8-jdk
sudo apt-get install gcc
sudo apt-get install git
sudo apt-get install zsh
sudo apt-get install curl

curl -sL git.io/antibody | sh -s

# Download and place diff-so-fancy
sudo curl -sL https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy \
          -o /bin/diff-so-fancy
