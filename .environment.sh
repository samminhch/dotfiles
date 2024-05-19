# You may need to manually set your language environment
export ZSH_ALIAS_FINDER_PREFIX=💡
export LANG=en_US.UTF-8

###########################
# UPDATING PATH VARIABLES #
###########################

# Add cargo binaries
if [ -d "$HOME/.cargo/bin" ]; then
    export PATH="$PATH:$HOME/.cargo/bin"
fi

# add ~/.local/bin to PATH
if [ -d "$HOME/.local/bin" ]; then
    export PATH="$HOME/.local/bin:$PATH"
fi

# add ~/.local/lib to PATH
if [ -d "$HOME/.local/lib" ]; then
    export PATH="$HOME/.local/lib:$PATH"
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
