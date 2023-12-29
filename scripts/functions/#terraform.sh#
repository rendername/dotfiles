tfp() {
    local output_dir=~/tmp/terraform-plans
    local suffix=$RANDOM
    local plan_path="$output_dir/plan_$suffix"

    mkdir -p "$output_dir"

    $TF_BIN plan -no-color | tee "$plan_path"
    echo "plan saved to $plan_path"
}


tfv() {
    choice=$(find . -name terragrunt.hcl -not -path "*/.terragrunt-cache/*" -type f|fzf)
    [ -z "$choice" ] && return
    cd $(dirname "$choice")
}
