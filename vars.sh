source $HOME/utils.sh

###################
# SETTING ALIASES #
###################
alias sudo='sudo '
alias rm='rm -i' # Ask before removing file
alias mv='mv -i' # Ask before moving file
alias ll='ls -alF'
alias la='ls -a'
alias cp="cp -i"     # Confirm before overwriting something
alias df='df -h'     # Human-readable sizes
alias free='free -m' # Show sizes in MB
alias gitu='git add . && git commit && git push'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

if [ -x /usr/bin/bat ]; then
    alias bathelp='bat --plain --language=help'
    help() {
        "$@" --help 2>&1 | bat --plain --language=help
    }
fi

# replace ls with lsd or exa
if command_exists -s lsd; then
    alias ls='lsd '
elif command_exists -s exa; then
    alias ls='exa -h --group-directories-first --icons --hyperlink --git'
fi

# helix alias
if command_exists -s helix; then
    alias hx='helix'
fi

# apt is nala if nala is installed
if command_exists -s apt nala; then
    alias apt='nala'
fi

# i want happy
if command_exists -s paru; then
    alias joy="paru "

fi

# Default editor is helix
if [ -f /usr/bin/hx ]; then
    export EDITOR='hx'
fi

if [ -f /usr/bin/helix ]; then
    export EDITOR='helix'
fi

# update alias!
if command_exists -s powerpill paru; then
    alias update="sudo pacman -Sy && sudo powerpill -Su && paru -Su"
elif command_exists -s powerpill yay; then
    alias update="sudo pacman -Sy && sudo powerpill -Su && yay -Su"
fi

###########################
# UPDATING PATH VARIABLES #
###########################
#emacs binary library
if [ -d "$HOME/.emacs.d/bin" ]; then
    export PATH="$PATH:$HOME/.emacs.d/bin"
fi

# Add cargo binaries
if [ -d "$HOME/.cargo/bin" ]; then
    export PATH="$PATH:$HOME/.cargo/bin"
fi

# bob-nvim path
if [ -d "$HOME/.local/share/bob/nvim-bin" ]; then
    export PATH="$PATH:$HOME/.local/share/bob/nvim-bin"
fi
# add ~/.local/bin to PATH
if [ -d "$HOME/.local/bin" ]; then
    export PATH="$HOME/.local/bin:$PATH"
fi

# add ~/.local/lib to PATH
if [ -d "$HOME/.local/lib" ]; then
    export PATH="$HOME/.local/lib:$PATH"
fi

if [ -d "$HOME/.spicetify" ]; then
    export PATH=$PATH:$HOME/.spicetify
fi

# pnpm
if [ -d "$HOME/.local/share/pnpm" ]; then
    export PNPM_HOME="$HOME/.local/share/pnpm"
    case ":$PATH:" in
    *":$PNPM_HOME:"*) ;;
    *) export PATH="$PNPM_HOME:$PATH" ;;
    esac
fi
# pnpm end

# Load Angular CLI autocompletion.
if [ -x "$HOME/.local/share/pnpm/ng" ]; then
    source <($HOME/.local/share/pnpm/ng completion script)
fi
