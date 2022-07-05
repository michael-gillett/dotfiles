export VAULT_ADDR=https://vault.liveramp.net
export CONSOLE_IMAGE=gcr.io/liveramp-eng/console:multiarch-latest

# NOTE: Needed to install ruby using rbenv on m1 macs
# https://github.com/rbenv/ruby-build/issues/1691#issuecomment-753636901
export RUBY_CFLAGS="-Wno-error=implicit-function-declaration"

# Uneeded after kubectl 1.25.x
# https://cloud.google.com/blog/products/containers-kubernetes/kubectl-auth-changes-in-gke
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

export PATH="/opt/homebrew/opt/mysql@5.7/bin:$PATH"
export PAsTH="/opt/homebrew/opt/mysql-client@5.7/bin:$PATH"
export PATH="$HOME/code/bin:$PATH"

##### Setup GCloud
source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc" # autocompletions
source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc" # add components to PATH
