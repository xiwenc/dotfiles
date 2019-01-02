#!/bin/bash

set -e
[ -n "$DEBUG" ] && set -x

MODULE_DIR="$PWD/$(dirname $0)"
MODULE_NAME="$(basename $MODULE_DIR)"
echo "Installing module $MODULE_NAME"

# Begin

# spf13
__symlink $MODULE_DIR/spf13-vim/.vimrc $HOME/.vimrc
__symlink $MODULE_DIR/spf13-vim/.vimrc.bundles $HOME/.vimrc.bundles
__symlink $MODULE_DIR/spf13-vim/.vimrc.before $HOME/.vimrc.before

# vundle
__symlink $MODULE_DIR/vundle $HOME/.vim/bundle/vundle -d


# static files
__symlink_all "$MODULE_DIR/static"

vim \
    "+set nomore" \
    "+BundleInstall!" \
    "+BundleClean" \
    "+qall"

# End

echo "Completed module $MODULE_NAME"
