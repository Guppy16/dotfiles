#!/bin/bash
set -euxo pipefail

USAGE=$(cat <<-END
    Usage: ./run.sh
    Install and deploy dotfile dependencies on linux
END
)

./install.sh --tmux --zsh
./deploy.sh --vim

