# source custom shell files
source $HOME/.aliases.sh
source $HOME/.externals.sh
source $HOME/.environment.sh

# Setup the directory we want to store zinit and its plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Install zinit if it wasn't already installed
if [ ! -d $ZINIT_HOME ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

# Load zinit plugins
zinit light Aloxaf/fzf-tab
zinit light jeffreytse/zsh-vi-mode
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting

# Load zinit snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::alias-finder
zinit snippet OMZP::command-not-found

# History settings
HISTSIZE=5000
SAVEHIST=$HISTSIZE
HISTFILE=$HOME/.zsh_history
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups

# Completions
autoload -U compinit; compinit
zinit cdreplay -q

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' matcher-list 'm:{A-Z}={A-Za-z}'

if [ -x /usr/bin/dircolors ]; then
    zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
fi

## Completions w/ fzf
eval "$(fzf --zsh)"
zstyle ':completion:*' meno no
zstyle ':fzf-tab-complete:cd:*' fzf-preview 'ls --color $realpath'

# Enable starship prompt
# Check that the function `starship_zle-keymap-select()` is defined.
# xref: https://github.com/starship/starship/issues/3418
type starship_zle-keymap-select >/dev/null || \
  {
    eval "$(starship init zsh)"
  }
