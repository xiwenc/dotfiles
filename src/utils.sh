__backup() {
    target="$1"
    if [ -f "$target" -o -L "$target" ]; then
        if [ "$FORCE_OVERRIDE" != "1" ]; then
            echo "WARNING: $target already exists"
            echo "Press ENTER to continue or CTRL-C to terminate"
            echo "export FORCE_OVERRIDE=1 if you don't want this prompt"
            read
        fi
        echo "Creating backup of $target"
        if [ ! -d "$BACKUP_DIR" ]; then
            echo "ERROR: BACKUP_DIR is not set"
            exit 1
        fi
        relative_target=$(echo "$target" | sed "s|^$HOME||")
        destination="${BACKUP_DIR}${relative_target}"
        destination_dir="$(dirname $destination)"
        mkdir -p $destination_dir &>/dev/null
        echo "Backup: $target to $destination"
        mv "$target" "$destination"
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
