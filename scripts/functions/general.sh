#clone() {
#    local repos_dir="/home/anthony/repos"
#    local repos=$(az repos list)
#    local choice=$(echo "$repos"|jq -r '.[].name'|fzf)
#    local defaultBranch=$(echo "$repos"|jq -r --arg choice "$choice" '.[]|select(.name == $choice)|.defaultBranch'|grep -oP '(?<=refs\/heads\/).*$')
#    
#    git clone -b "$defaultBranch" "$CLONE_URL/$choice" "$repos_dir/$choice/$defaultBranch"
#}

clone() {
    local repos_dir="/home/anthony/repos"
    local repos=$(az repos list)
    local choice=$(echo "$repos"|jq -r '.[].name'|fzf)
    
    git clone "$CLONE_URL/$choice" "$repos_dir/$choice"
}

#t()
#{
#    [ -z "$1" ] && local path=$(pwd) || local path="$1"
#    [ -z "$2" ] && local name=$(awk 'BEGIN { FS = "/" } ; { print $NF }' <<< "$path") || local name="$2"
#
#    tmux new -ds "$name" -c "$path"
#    tmux send-keys -t "$name" "clear && nvim -c 'Telescope find_files'" Enter
#    tmux split-window -v -c "$path"
#    tmux resize-pane -t "0" -D 85
#    tmux select-pane -t "0"
#    tmux resize-pane -Z
#    tmux attach -t "$name"
#}

t()
{
    [ -z "$1" ] && local path=$(pwd) || local path="$1"
    [ -z "$2" ] && local name=$(awk 'BEGIN { FS = "/" } ; { print $NF }' <<< "$path") || local name="$2"

    cd "$path" && clear && nvim -c 'Telescope find_files'
}

o ()
{
    local repos_dir=$HOME/repos
    local repo=$(ls $repos_dir/|fzf)

    [ -z "$repo" ] && echo "no selection made" && return

    t "$repos_dir/$repo" "$repo"
}
