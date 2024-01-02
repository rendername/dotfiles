d() {
    local repos_dir="/home/anthony/repos"
    local choice=$(ls "$repos_dir"|fzf)
    
    [ -z "$choice" ] && echo "no repo selected" && return

    if [ -z "$TMUX" ]; then
        for s in $(tmux ls | grep -oP '^\w+'); do
            if [ $s == "$choice" ]; then
                tmux attach -t "$choice"
                return
            fi
        done
        tmux new-session -s "$choice" -c "$repos_dir/$choice"
    else
        for s in $(tmux ls | grep -oP '^\w+'); do
            if [ $s == "$choice" ]; then
                tmux switch -t "$choice"
                return
            fi
        done

        tmux new-session -d -s "$choice" -c "$repos_dir/$choice"
        tmux switch -t "$choice"
    fi
}
