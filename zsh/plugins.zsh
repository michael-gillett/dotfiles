# Load ZSH Plugins from git submodules. This removes the need to use a zsh plugin manager
ZPLUGINDIR=$HOME/.zsh/plugins

source $ZPLUGINDIR/ohmyzsh/lib/git.zsh
source $ZPLUGINDIR/ohmyzsh/plugins/git/git.plugin.zsh
source $ZPLUGINDIR/ohmyzsh/plugins/kubectl/kubectl.plugin.zsh
source $ZPLUGINDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
source $ZPLUGINDIR/zsh-completions/zsh-completions.plugin.zsh
