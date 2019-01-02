__file_exists() {
    path="$1"
    if [ -f "$path" -o -L "$path" ]; then
        echo 1
    else
        echo 0
    fi
}

export -f __file_exists

__backup() {
    target="$1"
    file_exists=$(__file_exists "$target")
    if [ $file_exists -eq 1 ]; then
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

    current_link=$(readlink $dst || true)
    if [ "$current_link" != "$src" ]; then
        __backup "$dst"
        parent=$(dirname $dst)
        if [ ! -d "$parent" ]; then
            mkdir -p "$parent"
        fi
        ln -s "$src" "$dst"
    else
        echo "Symlink already correct: $dst -> $src"
    fi
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
