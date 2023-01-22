# aliases
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
if command -v lsd > /dev/null;
then
    alias ls='lsd '
elif command -v exa > /dev/null;
then
    alias ls='exa '
else
fi

# add ~/.local/bin to PATH
export PATH=$HOME/.local/bin:$PATH

# add ~/.local/lib to PATH
if [ -d $HOME/.local/lib ]
then
    export PATH=$HOME/.local/lib:$PATH
fi

# helix alias
if command -v helix &> /dev/null;
then
    alias hx='helix'
fi

# apt is nala if nala is installed
if command -v apt &> /dev/null && command -v nala &> /dev/null;
then
    alias apt='nala'
fi

if command -v paru &> /dev/null;
then
    alias joy="paru "
fi

# fnm integration
if [ -e $HOME/.local/share/fnm ]
then
    export PATH="$HOME/.local/share/fnm:$PATH"
    eval "`fnm env`"
fi

if command -v fnm &> /dev/null;
then
    eval "$(fnm env --use-on-cd)" 
fi

# pyenv integration
if [ -e $HOME/.pyenv ]
then
    export PYENV_ROOT="$HOME/.pyenv"
    command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
fi

# add Flutter to path. It should be installed on the home directory
if [ -e $HOME/flutter ]
then
    export PATH="$PATH:`pwd`/flutter/bin"
fi
