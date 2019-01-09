#!/bin/bash

set -e
[ -n "$DEBUG" ] && set -x

MODULE_DIR="$PWD/$(dirname $0)"
MODULE_NAME="$(basename $MODULE_DIR)"
echo "Installing module $MODULE_NAME"

# Begin

__ensure_package tmux

# example
__symlink $MODULE_DIR/gpakosz-tmux/.tmux.conf $HOME/.tmux.conf

# static files
__symlink_all "$MODULE_DIR/static"


# End

echo "Completed module $MODULE_NAME"
