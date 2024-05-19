source $HOME/.utils.sh

######################
# SETTING UP ALIASES #
######################
alias sudo='sudo '
alias rm='rm -i' # Ask before removing file
alias mv='mv -i' # Ask before moving file
alias ll='ls -alF'
alias la='ls -a'
alias cp="cp -i"     # Confirm before overwriting something
alias df='df -h'     # Human-readable sizes
alias free='free -m' # Show sizes in MB
alias gitu='git add .; git commit; git push'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    if test -r $HOME/.dircolors; then
        eval "$(dircolors -b ~/.dircolors)"
    else
        eval "$(dircolors -b)"
    fi
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

if command_exists -s powerpill paru; then
    alias update="sudo pacman -Sy; sudo powerpill -Su; paru -Su"
elif command_exists -s powerpill yay; then
    alias update="sudo pacman -Sy; sudo powerpill -Su; yay -Su"
fi

# replace ls with lsd or exa
if command_exists -s lsd; then
    alias ls='lsd '
elif command_exists -s exa; then
    alias ls='exa -h --group-directories-first --icons --hyperlink --git'
fi

# apt is nala if nala is installed
if command_exists -s apt nala; then
    alias apt='nala'
fi

if command_exists -s bat; then
    export BAT_THEME="ansi"
    alias bathelp='bat --plain --language=help'
    help() {
        "$@" --help 2>&1 | bat --plain --language=help
    }
fi
