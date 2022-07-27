HISTCONTROL=ignoreboth
shopt -s histappend

HISTSIZE=200
HISTFILESIZE=2000

shopt -s checkwinsize

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

unset color_prompt force_color_prompt

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

### Custom Stuff by me, though it's mostly aliases ###
## PS1 ##
    if command -v git &>/dev/null; then
        PS1='\[\e[1;33m\]${debian_chroot:+($debian_chroot)}\[\e[1;36m\]\u\[\e[1;37m\]@\[\e[1;32m\]\h\[\e[0m\]:\w$(__git_ps1 "\[\e[1;32m\][%s]\[\e[0m\]")\$ '
    else
        PS1='\[\e[1;33m\]${debian_chroot:+($debian_chroot)}\[\e[1;36m\]\u\[\e[1;37m\]@\[\e[1;32m\]\h\[\e[0m\]:\w\$ '
    fi

## XDG Directories Config##
if [[ -n $XDG_STATE_HOME ]]; then
    if [[ ! -d "$XDG_STATE_HOME/bash" ]]; then
        mkdir -p "$XDG_STATE_HOME/bash"
    elif [[ -d "$XDG_STATE_HOME/bash" ]]; then
        HISTFILE="$XDG_STATE_HOME/bash/history"
    fi

    if [[ -f "$HOME/.bash_history" ]]; then
        rm $HOME/.bash_history
    fi
else
    HISTFILE=$HOME/.bash_history
fi

if [[ -n $XDG_CACHE_HOME ]]; then
    alias wget='wget --hsts-file="$XDG_DATA_HOME/wget-hsts"'
fi

## Aliases ##
# APT
    alias apts='apt search'
    alias aptup='sudo apt update && sudo apt upgrade'
    alias aptupd='sudo apt update'
    alias aptupg='sudo apt upgrade'
    alias aptfix='sudo apt --fix-broken install'
    alias aptin='sudo apt install'
    alias aptrm='sudo apt remove'
    alias aptarm='sudo apt autoremove'
    alias aptppa='sudo add-apt-repository'

# Clear
    alias cls='clear'

# Grep
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'

# Ls
    alias ls='ls --color=auto -A'
    alias ll='ls -alF'
    alias la='ls -A'
    alias l='ls -CF'
    alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

# Neofetch
    if [[ "$TERM" == "xterm-kitty" ]] && [[ -f "$HOME/git/croi-wallpapers/profile-pics/0000001.png" ]]; then
        alias neofetch='neofetch --backend kitty --source ~/git/croi-wallpapers/profile-pics/0000001.png --size 28% --colors 2 7 6 6 7 4'
    else
        alias neofetch='neofetch --colors 2 7 6 6 7 4'
    fi

# Steam Games
    if command -v steam &>/dev/null; then
        alias toram_online='steam steam://rungameid/1827180'
    fi

# Suckless compile
    alias suck='sudo make clean install'

# Weather cURL
    alias weather='curl wttr.in/cavite'

## Functions ##
# C Compile - Lazy to type gcc file.c -o file.out
ccompile() {
    filename=$(echo $1 | sed -sE 's/\.[a-zA-Z]+$//')
    gcc $1 -o $filename.out -lm
}

# Gitall - git add, commit, and push
gitall() {
    git add .

    if [[ -n $1 ]]; then
        git commit -m "$1"
    else
        git commit -m "Updated"
    fi

    git push origin HEAD
}

# Up - go up by specified amount of directories
up() {
    if [[ $1 =~ [^0-9] ]]; then
        echo "Please use a whole number"
        return 1
    elif [[ -z $1 ]]; then
        cd ../
    else
        for i in $(seq $1); do
            cd ../
        done
    fi
}

ytmp3() {
    if ! command -v &>/dev/null; then
        echo "yt-dlp cannot be found, please get it"
        exit 1
    fi

    yt-dlp -x --audio-format mp3 --audio-quality 0 $1
    rename -v 's/ \([\w ]+\)| \[[\w-]+\]//g' *.mp3
    return 0
}

ytmp4() {
    if ! command -v &>/dev/null; then
        echo "yt-dlp cannot be found, please get it"
        exit 1
    fi

    yt-dlp --format mp4 $1
    rename -v 's/ \([\w ]+\)| \[[\w-]+\]//g' *.mp4
    return 0
}

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
