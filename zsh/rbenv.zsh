# NOTE: Needed to install ruby using rbenv on m1 macs
# https://github.com/rbenv/ruby-build/issues/1691#issuecomment-753636901
export RUBY_CFLAGS="-Wno-error=implicit-function-declaration"
# # https://github.com/openssl/openssl/issues/18720#issuecomment-1180702773
# export OPENSSL_CFLAGS="-Wno-error=implicit-function-declaration"
# Tell rbenv to use the homebrew installation of openssl
# export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
# export CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
# export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

# Initialize rbenv https://github.com/rbenv/rbenv
eval "$(rbenv init - zsh)"
