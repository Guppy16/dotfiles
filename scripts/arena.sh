#!/bin/bash

# Script to setup environment for arena projects on vast GPUs

set -euxo pipefail

USAGE=$(cat <<-END
    Usage: ./run.sh
    Install and deploy dotfile dependencies on linux
END
)

touch ~/.no_auto_tmux

sudo apt-get update

./setup.sh --tmux --zsh
./deploy.sh --vim --skip_zsh

sudo apt-get install ffmpeg -y
echo "alias ffmpeg='/usr/bin/ffmpeg'" >> ~/.zshrc

zsh

echo "Open a new terminal to get rid of the auto tmux"