#!/bin/bash
set -e

target="$1"
echo "Installing symlinks from $target"

cd "$target" || exit 0

for i in $(find . -maxdepth 1 -type f | sed 's/^\.\///'); do
    dst="$HOME/$i"
    src="$target/$i"
    echo "Creating symlink $dst -> $src"
    __backup "$dst"
    ln -s "$src" "$dst"
done
