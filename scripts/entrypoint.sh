source "$SCRIPTS_PATH/startup.sh"
source "$SCRIPTS_PATH/aliases.sh"

for f in $(find "$SCRIPTS_PATH/functions" -name "*.sh" -type f); do
    source "$f"
done
