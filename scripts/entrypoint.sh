for f in $(find "$SCRIPTS_PATH/user" -name "*.sh" -type f); do
    source "$f"
done

if [ -d "/home/anthony/.scripts-local" ]; then
    for f in $(find "/home/anthony/.scripts-local" -name "*.sh" -type f); do
        source "$f"
    done
fi
