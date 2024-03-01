tfp() {
    local output_dir="/tmp"
    local suffix=$RANDOM
    local plan_path="$output_dir/plan_$suffix"

    mkdir -p "$output_dir"

    $TF_BIN plan -no-color -out latest.plan | tee "$plan_path"
    echo "plan saved to $plan_path"
}

tfs() {
    local plan_name="latest.plan"
    local plan_path=$(find . -name latest.plan -type f)

    [ -z "$plan_path" ] && echo "no latest.plan no summary available" && return

    local tf_path=$(dirname "$plan_path")

    echo "getting a summary for this plan..."

    pushd "$tf_path" 2>&1> /dev/null
        terraform init 2>&1> /dev/null
        tf-summarize -md latest.plan
    popd 2>&1> /dev/null
}


tfv() {
    choice=$(find . -name terragrunt.hcl -not -path "*/.terragrunt-cache/*" -type f|fzf)
    [ -z "$choice" ] && return
    cd $(dirname "$choice")
}
