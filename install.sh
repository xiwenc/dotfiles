#!/bin/bash

set -e
cd $(dirname $0)

# backup directory
export BACKUP_DIR="/tmp/dotfiles-$(date '+%Y%m%d%H%M%S')"
mkdir "$BACKUP_DIR"

__backup() {
    if [ -f "$1" -o -L "$1" ]; then
        target=$(echo "$1" | sed "s|^$HOME||")
        echo "Creating backup of $target"
        if [ ! -d "$BACKUP_DIR" ]; then
            echo "ERROR: BACKUP_DIR is not set"
            exit 1
        fi
        destination="$BACKUP_DIR$target"
        destination_dir="$(dirname $destination)"
        mkdir -p $destination_dir &>/dev/null
        echo "Backup: $1 to $destination"
        mv "$1" "$destination"
    fi
}

export -f __backup

for i in $(find modules -name install.sh); do
    $i
done


echo "Old files have been backed up at: $BACKUP_DIR"
find $BACKUP_DIR
echo "Please review these if needed"
