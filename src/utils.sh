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

__symlink() {
    src="$1"
    dst="$2"

    __backup "$dst"
    ln -s "$src" "$dst"
}
export -f __symlink

__symlink_all() {
    base="$1"
    for src in $(find $base -type f); do
        dst=$(echo $src | sed "s|^$base|$HOME|")
        __symlink "$src" "$dst"
    done
}

export -f __symlink_all
