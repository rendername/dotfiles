function fix_time() {
    sudo hwclock -s
}

function td() {
    local path=$(git rev-parse --show-toplevel)
    cd "$path"
    echo "changed directory to $path"
}
