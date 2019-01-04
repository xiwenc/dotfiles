#!/bin/bash

set -e
[ -n "$DEBUG" ] && set -x

MODULE_DIR="$PWD/$(dirname $0)"
MODULE_NAME="$(basename $MODULE_DIR)"
echo "Installing module $MODULE_NAME"

# Begin

__ensure_package git
__ensure_package curl
__ensure_package python@2 /usr/local/bin/python
__ensure_package python@3 /usr/local/bin/python3

# static files
# __symlink_all "$MODULE_DIR/static"


# End

echo "Completed module $MODULE_NAME"
