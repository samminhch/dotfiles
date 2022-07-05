# !/usr/bin/zsh

# Resources
source ~/utils.sh
source ~/vars.sh
GIT_PATH=~/Downloads/git
ZSH_PATH=~/.config/zsh

# Enable starship prompt
if command -v starship &> /dev/null;
then
    eval "$(starship init zsh)"
fi

# shell autocomplete
autoload -Uz compinit
autoload bashcompinit

compinit
bashcompinit
source /usr/share/bash-completion/completions/*
