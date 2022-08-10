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

if [ -x /usr/bin/dircolors ]; then
    test -r $HOME/.dircolors && eval "$(dircolors -b $HOME/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# add ~/.local/bin to PATH
if [ -d $HOME/.local/bin ]
then
    export PATH=$HOME/.local/bin:$PATH
fi

# replace apt with nala only if apt is installed
if command -v nala &> /dev/null;
then
    alias apt='nala'
fi

# fnm integration
if command -v fnm &> /dev/null;
then
    export PATH=$HOME/.fnm:$PATH
    eval "$(fnm env --use-on-cd)" 
fi

# pyenv integration, assuming it's installed into ~/.pyenv
if [ -d $HOME/.pyenv ]
then
    export PYENV_ROOT=$HOME/.pyenv
    export PATH=$PYENV_ROOT/bin:$PATH
    eval "$(pyenv init -)"
fi
