########## Homebrew ##########
export PATH=/opt/homebrew/bin:$PATH

# Case insensitive tab completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
# Auto load suggestions when correcting case
setopt MENU_COMPLETE

# Set custom prompt
PROMPT='%B%F{white}%2d >%F{reset}%b '

# Reload completions
autoload -Uz compinit
# Set a cache dir
export ZSH_CACHE_DIR=$HOME/.zsh/cache

for dump in ~/.zcompdump(N.mh+24); do
  compinit
done

compinit -C

# Source all config in ~/.zsh/*.zsh
for conf in "$HOME/.zsh/"*.zsh; do
  source "${conf}"
done
unset conf


# Share history between tabs
setopt share_history

########## GPG setup for SSH ##########
# https://developer.okta.com/blog/2021/07/07/developers-guide-to-gpg#enable-your-gpg-key-for-ssh
# export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
# Start gpg-agent, if it isn't started already
# gpgconf --launch gpg-agent
# gpg-connect-agent updatestartuptty /bye > /dev/null
# Set an environment variable to tell GPG the current terminal.
# export GPG_TTY=$(tty)

# Computer specific enviroment config
# source ~/.zshrc_extensions
source /Users/mgille/.liveramp_profile

source /Users/mgille/.docker/init-zsh.sh || true # Added by Docker Desktop
