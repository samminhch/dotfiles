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
    else
        echo "$1 was not linked to $2."
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
            *)           echo "'$1' cannot be extracted via ex()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# from https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh
command_exists() 
{
  command -v "$1" >/dev/null 2>&1
}
