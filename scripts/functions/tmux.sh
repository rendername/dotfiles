d() {
    local repos_dir="/home/anthony/repos"
    local choice=$(ls "$repos_dir"|fzf)
    
    [ -z "$choice" ] && echo "no repo selected" && return

    if [ -z "$TMUX" ]; then
        tmux new-session -s "$choice" -c "$repos_dir/$choice"
    else
        tmux new-session -d -s "$choice" -c "$repos_dir/$choice"
        tmux switch -t "$choice"
    fi
}
