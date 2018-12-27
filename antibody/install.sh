#!/bin/sh
antibody bundle < "$HOME/.dotfiles/antibody/bundles.txt" > ~/.zsh_plugins.sh
antibody update
