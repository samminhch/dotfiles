source ./utils.sh

###################
# SETTING ALIASES #
###################
alias sudo='sudo '
alias rm='rm -i'                                    # Ask before removing file
alias mv='mv -i'                                    # Ask before moving file
alias ll='ls -alF'
alias la='ls -a'
alias cp="cp -i"                                    # Confirm before overwriting something
alias df='df -h'                                    # Human-readable sizes
alias free='free -m'                                # Show sizes in MB
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

# replace ls with lsd or exa
if command_exists lsd;
then
    alias ls='lsd '
elif command_exists exa;
then
    alias ls='exa '
fi

# helix alias
if command_exists helix;
then
    alias hx='helix'
fi

# apt is nala if nala is installed
if command_exists apt nala;
then
    alias apt='nala'
fi

# i want happy
if command_exists paru;
then
    alias joy="paru "

fi

# Default editor is neovim
if [ -f /usr/bin/nvim ] || [ -x $HOME/.local/share/bob/nvim-bin ];
then
    export EDITOR='nvim'
fi

# update alias!
if command_exists powerpill paru;
then
    alias update="sudo pacman -Sy && sudo powerpill -Su && paru -Su"
elif command_exists powerpill yay;
then
    alias update="sudo pacman -Sy && sudo powerpill -Su && yay -Su"
fi

###########################
# UPDATING PATH VARIABLES #
########################### 
#emacs binary library
if [ -d "$HOME/.emacs.d/bin" ]
then
    export PATH="$PATH:$HOME/.emacs.d/bin"
fi

# Add cargo binaries
if [ -d "$HOME/.cargo/bin" ]
then
    export PATH="$PATH:$HOME/.cargo/bin"
fi

# bob-nvim path
if [ -d "$HOME/.local/share/bob/nvim-bin" ]
then
    export PATH="$PATH:$HOME/.local/share/bob/nvim-bin"
fi
# add ~/.local/bin to PATH
if [ -d "$HOME/.local/bin" ];
then
    export PATH="$HOME/.local/bin:$PATH"
fi

# add ~/.local/lib to PATH
if [ -d "$HOME/.local/lib" ]
then
    export PATH="$HOME/.local/lib:$PATH"
fi

