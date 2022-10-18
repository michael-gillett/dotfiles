# NOTE: Needed to install ruby using rbenv on m1 macs
# https://github.com/rbenv/ruby-build/issues/1691#issuecomment-753636901
export RUBY_CFLAGS="-Wno-error=implicit-function-declaration"

# Initialize rbenv https://github.com/rbenv/rbenv
eval "$(rbenv init - zsh)"
