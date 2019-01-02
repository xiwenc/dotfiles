#!/bin/bash

set -e
cd $(dirname $0)

# backup directory
export BACKUP_DIR="/tmp/dotfiles-$(date '+%Y%m%d%H%M%S')"
mkdir "$BACKUP_DIR"


echo "
==== WARNING
 This install script changes your HOME directory by creating symlinks this repository.
 If we need to override an existing file we will prompt you in time. This file will be
 backed up at the following location: $BACKUP_DIR

 export FORCE_OVERRIDE=1 to suppress all override prompts

 If you do not wish to continue press CTRL-C now
 To continue with the installation press ENTER

==== WARNING

"

read

## load libraries
for lib in $(find lib -type f -name \*.sh); do
    echo "Loading library $lib"
    source $lib
done

echo "Finished loading all libraries


"

echo "Installing modules:"
## install all modules
for i in $(find modules -name install.sh | sort); do
    $i
done


echo "Old files have been backed up at: $BACKUP_DIR"
find $BACKUP_DIR
echo "Please review these if needed"
