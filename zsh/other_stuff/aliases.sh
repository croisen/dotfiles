## Aliases ##
# adb
    if command -v adb &>/dev/null; then
        alias adb='HOME="$XDG_DATA_HOME"/android adb'
    fi

# APT
if command -v apt &>/dev/null; then
    alias apts='apt search'
    if command -v sudo &>/dev/null; then
        alias aptup='sudo apt update && sudo apt upgrade'
        alias aptupd='sudo apt update'
        alias aptupg='sudo apt upgrade'
        alias aptfix='sudo apt --fix-broken install'
        alias aptin='sudo apt install'
        alias aptrm='sudo apt remove'
        alias aptarm='sudo apt autoremove'
        alias aptppa='sudo add-apt-repository'
    else
        alias aptup='apt update && apt upgrade'
        alias aptupd='apt update'
        alias aptupg='apt upgrade'
        alias aptfix='apt --fix-broken install'
        alias aptin='apt install'
        alias aptrm='apt remove'
        alias aptarm='apt autoremove'
        alias aptppa='add-apt-repository'
    fi
fi

# Clear
    alias cls='clear'

# Grep
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'

# Ls
    alias ls='ls --color=auto -A --group-directories-first'
    alias ll='ls -alF'
    alias la='ls -A'
    alias l='ls -CF'
    alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

# mysql
    if command -v mysql-workbench; then
        alias mysql-workbench=mysql-workbench --configdir="$XDG_DATA_HOME/mysql/workbench"
    fi

# Neofetch
    #alias neofetch='neofetch --ascii "$(echo "Say my name." | cowsay -f ~/.config/neofetch/walter.white -W 30)"'
    if command -v neofetch &>/dev/null; then
        alias neofetch='neofetch --source ~/.config/neofetch/logo'
    fi

# Pacman and AUR helpers
    if command -v pacman &>/dev/null; then
        if command -v sudo &>/dev/null; then
            alias pacinst='sudo pacman -Sy'
            alias pacupdt='sudo pacman -Syu'
            alias pacremv='sudo pacman -Rsu'
        else
            alias pacinst='pacman -S'
            alias pacsear='pacman -Ss'
            alias pacupdt='pacman -Syu'
            alias pacremv='pacman -Rsu'
        fi
        alias pacsear='pacman -Ss'
        alias paclist='pacman -Qs'

        if command -v yay &>/dev/null; then
            alias pacinst='yay -S'
            alias pacsear='yay -Ss'
            alias pacupdt='yay -Syu'
            alias pacremv='yay -Rsu'
            alias pacsear='yay -Ss'
            alias paclist='yay -Qs'
        fi

        if command -v paru &>/dev/null; then
            alias pacinst='paru -S'
            alias pacsear='paru -Ss'
            alias pacupdt='paru -Syu'
            alias pacremv='paru -Rsu'
            alias pacsear='paru -Ss'
            alias paclist='paru -Qs'
        fi
    fi

# Python :)
    #alias py='python3'

# Steam Games
    if command -v steam &>/dev/null; then
        alias toram_online='steam steam://rungameid/1827180'
    fi

# Suckless compile
    alias suck='sudo make clean install'

# SVN
    alias svn='svn --config-dir $XDG_CONFIG_HOME/subversion'

# Weather cURL
    alias weather='curl wttr.in/cavite'

# yarn
    if [[ -n $XDG_CONFIG_HOME ]]; then
        alias yarn="yarn --use-yarnrc $XDG_CONFIG_HOME/yarn/config"
    fi

# wget
    alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'
