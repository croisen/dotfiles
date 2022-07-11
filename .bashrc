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
        PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '

## Aliases ##
    # Advance Package Tool
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
        # alias cls='clear && neofetch --source /home/andrew/stuff/misc/ascii_art/rick-astley.txt --colors 4 7 7 4 7 7'
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

    # Weather cURL
        alias weather='curl wttr.in/cavite'

    # yt-dlp
        # Download as mp3
        alias ytmp3='yt-dlp -x --audio-format mp3 --audio-quality 0'

        # Download as mp4
        alias ytmp4='yt-dlp -f mp4'
