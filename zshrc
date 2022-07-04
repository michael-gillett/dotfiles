########## Homebrew ##########
export PATH=/opt/homebrew/bin:$PATH

# Case insensitive tab completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
# Auto load suggestions when correcting case
setopt MENU_COMPLETE

# Set custom prompt
PROMPT='%F{green}%2d > '
# Set a cache dir
export ZSH_CACHE_DIR=$HOME/.zsh/cache

# Reload completions
autoload -Uz compinit

for dump in ~/.zcompdump(N.mh+24); do
  compinit
done

compinit -C

# Init rbenv
# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init -)"

# Init conda
# source ~/miniconda/etc/profile.d/conda.sh

# Aliases
deti() {
  docker run --rm -it --entrypoint "/bin/sh" "$1"
}

# fnm node version manager setup
eval "$(fnm env --use-on-cd)"

# Load ZSH Plugins
ZPLUGINDIR=$HOME/.zsh/plugins
source $ZPLUGINDIR/ohmyzsh/lib/git.zsh
source $ZPLUGINDIR/ohmyzsh/plugins/git/git.plugin.zsh
source $ZPLUGINDIR/ohmyzsh/plugins/kubectl/kubectl.plugin.zsh

########## GPG setup for SSH ##########
# https://developer.okta.com/blog/2021/07/07/developers-guide-to-gpg#enable-your-gpg-key-for-ssh
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
# Start gpg-agent, if it isn't started already
gpgconf --launch gpg-agent
gpg-connect-agent updatestartuptty /bye > /dev/null
# Set an environment variable to tell GPG the current terminal.
export GPG_TTY=$(tty)

# Computer specific enviroment config
# source ~/.zshrc_extensions
