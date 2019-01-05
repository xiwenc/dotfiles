#!/bin/bash

set -e
[ -n "$DEBUG" ] && set -x

MODULE_DIR="$PWD/$(dirname $0)"
MODULE_NAME="$(basename $MODULE_DIR)"
echo "Installing module $MODULE_NAME"

# Begin

__ensure_package git
__ensure_package curl

os=$(uname -s)
if [ "$os" == "Darwin" ]; then
    __ensure_package python@2 /usr/local/bin/python
    __ensure_package python@3 /usr/local/bin/python3
else
    __ensure_package python
    __ensure_package python3
fi

# static files
# __symlink_all "$MODULE_DIR/static"


# End

echo "Completed module $MODULE_NAME"
