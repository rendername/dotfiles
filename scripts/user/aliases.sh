alias l="lsd -lh"
alias c="clear"
alias cl="clear; lsd -lh"
alias copy="xclip -sel clip"
alias tl="tmux ls"
alias k="kubectl"
alias r="source ~/.bashrc && echo 'bashrc reloaded'"
alias random_password="openssl rand -base64 18"
alias g="grep --exclude-dir .terragrunt-cache"
alias vim="nvim"
alias v="nvim"
alias tk="tmux kill-session"
alias e="emacs -nw"
alias emacs="emacs -nw"

# change this to do a tmux session if not already created or connect if it is
#alias n="vim ~/vimwiki/index.md" # vimwiki sym-linked to /mnt/c/Users/anthony/wiki

# terraform/terragrunt
export TF_BIN="terragrunt" # terraform || terragrunt
alias tf="$TF_BIN"
alias tfi="$TF_BIN init -upgrade"
alias tfa="$TF_BIN apply"
alias tfc="rm -rf .terraform .terragrunt-cache"
alias tfcp="tfc && tfp"

 # git
 alias gst="git status"
 alias gp="git pull"
