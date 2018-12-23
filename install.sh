#!/bin/bash

set -e
cd $(dirname $0)

# backup directory
export BACKUP_DIR="/tmp/dotfiles-$(date '+%Y%m%d%H%M%S')"
mkdir "$BACKUP_DIR"

source ./src/utils.sh

## install all modules
for i in $(find modules -name install.sh); do
    $i
done


echo "Old files have been backed up at: $BACKUP_DIR"
find $BACKUP_DIR
echo "Please review these if needed"
