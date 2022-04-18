# !/usr/bin/zsh

# Resources
source ~/utils.sh
source ~/vars.sh
GIT_PATH=~/Downloads/git
ZSH_PATH=~/.config/zsh

# Enable starship prompt
if [ -e /usr/local/bin/starship ]
then
    eval "$(starship init zsh)"
fi

autoload bashcompinit
bashcompinit
source /usr/share/bash-completion/completions/*
