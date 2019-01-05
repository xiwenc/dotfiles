#!/bin/bash

set -e
[ -n "$DEBUG" ] && set -x

MODULE_DIR="$PWD/$(dirname $0)"
MODULE_NAME="$(basename $MODULE_DIR)"
echo "Installing module $MODULE_NAME"

# Begin

__ensure_package zsh

zsh_shell=$(grep $USER /etc/passwd | grep bin/zsh || true)
if [ -z "$zsh_shell" ]; then
    echo "Changing default shell to zsh..."
    zsh_location=$(grep bin/zsh\$ /etc/shells | tail -n1)
    chsh -s $zsh_location
    echo "Please relogin asap"
fi

# example
__symlink $MODULE_DIR/zim $HOME/.zim

# static files
__symlink_all "$MODULE_DIR/static"


# End

echo "Completed module $MODULE_NAME"
