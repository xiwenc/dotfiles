#!/bin/bash

set -e -x
echo "Installing module: vim"
MY_DIR="$PWD/$(dirname $0)"

__backup $HOME/.vimrc
__backup $HOME/.vimrc.bundles
__backup $HOME/.vimrc.before

# spf13
ln -s $MY_DIR/spf13-vim/.vimrc $HOME/.vimrc
ln -s $MY_DIR/spf13-vim/.vimrc.bundles $HOME/.vimrc.bundles
ln -s $MY_DIR/spf13-vim/.vimrc.before $HOME/.vimrc.before

# static files
$MY_DIR/../../utils/create-symlinks.sh "$MY_DIR/static"

vim \
    "+set nomore" \
    "+BundleInstall!" \
    "+BundleClean" \
    "+qall"

echo "Completed module vim"
