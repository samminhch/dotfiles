# Load Angular CLI autocompletion.
# if [ -x "$HOME/.local/share/pnpm/ng" ]; then
#     source <($HOME/.local/share/pnpm/ng completion script)
# fi

# Load arduino-cli autocompletion
if [ command -v arduino-cli &> /dev/null ]; then
    source <(arduino-cli completion zsh)
fi
