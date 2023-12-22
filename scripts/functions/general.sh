d() {
    local repos_dir="/home/anthony/repos"
    local choice=$(ls "$repos_dir"|fzf)
    
    [ -z "$choice" ] && echo "no repo selected" && return
    
    cd "$repos_dir/$choice"
}

fix_time() {
    sudo hwclock -s
}
