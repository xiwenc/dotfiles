__ensure_package() {
    package_name="$1"
    executable="$2"

    if [ -z "$executable" ]; then
        executable=$(which $package_name &2> /dev/null || true)
    fi

    file_exists=$(__file_exists "$executable")
    if [ $file_exists -eq 1 ]; then
        echo "INFO: $package_name is already installed"
        return
    fi

    os=$(uname -s)
    echo "INFO: installing $package_name"
    if [ "$os" == "Darwin" ]; then
        brew install --force $package_name
    elif [ "$os" == "Ubuntu" ]; then
        sudo apt install -y $package_name
    else
        echo "ERROR: Unsupported OS/Platform: $os"
        exit 1
    fi
}
export -f __ensure_package
