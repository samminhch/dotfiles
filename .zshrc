# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder # just remind me to update when it's time

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Plugins
plugins=(
    gh
    git
    sudo
    zsh-alias-finder
    zsh-autosuggestions
    zsh-syntax-highlighting
)

export ZSH_ALIAS_FINDER_PREFIX=💡
source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# source custom shell files
source $HOME/utils.sh
source $HOME/vars.sh

# Enable starship prompt
eval "$(starship init zsh)"

# default blinking cursor
echo '\e[1 q'
