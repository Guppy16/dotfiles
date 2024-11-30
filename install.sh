#!/bin/bash

# This script is intended to be run when setting up a new
# GitHub codespace.

set -euo pipefail


# Update repositories
sudo apt-get update

# Install dependencies and software
./setup.sh --zsh --tmux

# Deploy dotfiles, but skip running "zsh" at the end
./deploy.sh --vim --skip_zsh

# Intialise zsh custom dir, depending on if it's passed in or not
: ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}

git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions
git clone --depth 1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions.git ${ZSH_CUSTOM}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-history-substring-search.git ${ZSH_CUSTOM}/plugins/zsh-history-substring-search

# Reload the shell with zsh
zsh
