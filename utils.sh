print_error()
{
    local RED="\033[31m"
    local RED_BOLD="\033[1;31m"
    local RESET="\033[0m"

    printf "%b[ERROR]%b " "$RED_BOLD" "$RED"
    printf "%s%b\n" "$1" "$RESET"
}

print_okay()
{
    local GREEN="\033[32m"
    local GREEN_BOLD="\033[1;32m"
    local RESET="\033[0m"

    printf "%b[OKAY]%b " "$GREEN_BOLD" "$GREEN"
    printf "%s%b\n" "$1" "$RESET"
}

req_link()
{
    read -p "Do you wish to sync '$1' to '$2' [y/N]? " resp
    if [[ $resp =~ [Yy] ]];
    then
        if [[ -e $1 ]];
        then
            mv $1 $1.old
        fi

        ln -s $2 $1
        print_okay "$1 was linked to $2"
    else
        print_error "$1 was not linked to $2"
    fi
}

#
# # ex - archive extractor
# # usage: ex <file>
ex()
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1   ;;
            *.tar.gz)    tar xzf $1   ;;
            *.bz2)       bunzip2 $1   ;;
            *.rar)       unrar x $1   ;;
            *.gz)        gunzip $1    ;;
            *.tar)       tar xf $1    ;;
            *.tbz2)      tar xjf $1   ;;
            *.tgz)       tar xzf $1   ;;
            *.zip)       unzip $1     ;;
            *.Z)         uncompress $1;;
            *.7z)        7z x $1      ;;
            *)           print_error "'$1' cannot be extracted via ex()" ;;
        esac
    else
        print_error "'$1' is not a valid file"
    fi
}

# from https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh
command_exists() 
{
    for cmd_name in "$@"; do
        command -v "$cmd_name" >/dev/null
        cmd_status=$?

        if [ "$cmd_status" -eq 0 ];
        then
            print_okay "$cmd_name is an executable"
        else
            print_error "$cmd_name isn't an executable"
        fi

        overall_status=$(( overall_status > cmd_status ? overall_status : cmd_status ))
    done

    return $overall_status
}

get_loc()
{
    if [ -f /bin/curl ]
    then
        curl https://ipinfo.io/$(curl -s https://ipinfo.io/ip)
    fi
}

nvims()
{
    # check if these commands exists
    if ! command_exists nvim fzf grep bc;
    then
        return 1
    fi

    # check if the correct neovim version is installed
    local required_version=0.9
    local nvim_version=$(nvim --version | grep -oP 'NVIM v\K([0-9]+\.[0-9]+)')
    
    if (( $(echo "$nvim_version >= $required_version" | bc -l) ));
    then
        print_okay "NeoVim version >= $required_version"
    else
        print_error "Neovim version is not $required_version. Found version: $nvim_version"
    fi


    # add your neovim configuration names here
    items=("🐸" "NvChad" "AstroNvim")
    config=$(printf "%s\n" "${items[@]}" | fzf --prompt="im config  " --height=50% --layout=reverse --border --exit-0)

    if [[ -z $config ]];
    then
        echo "Nothing selected"
        return 0
    elif [[ $config == "default" ]]
    then
        config=""
    fi

    NVIM_APPNAME=$config nvim $@
}
