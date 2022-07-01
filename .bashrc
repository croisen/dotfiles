# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=200
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

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

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


### Custom Stuff by me ###
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
        alias cls='clear && fortune | cowsay'

    # Grep
        alias grep='grep --color=auto'
        alias fgrep='fgrep --color=auto'
        alias egrep='egrep --color=auto'

    # Ls
        alias ls='ls --color=auto'
        alias ll='ls -alF'
        alias la='ls -A'
        alias l='ls -CF'
        alias dir='dir --color=auto'
        #alias vdir='vdir --color=auto'

    # TLauncher Shortcut
        alias tlauncher='java -jar /opt/TLauncher/TLauncher-2.841.jar'

    # Tor Browser
        alias start-tor='cd /opt/tor-browser/ && ./start-tor-browser.desktop && cd ~'

    # Weather cURL
        alias weather='curl wttr.in/cavite'

    # Virtual Box
        alias virtualbox='virtualbox --style fusion'

    # yt-dlp
        # Download as mp3
        alias ytmp3='yt-dlp -x --audio-format mp3 --audio-quality 0'

        # Download as mp4
        alias ytmp4='yt-dlp -f mp4'

## Fun Startup ##
    # neofetch --source /home/andrew/stuff/misc/ascii_art/rick-astley.txt --colors 4 7 7 4 7 7
    fortune | cowsay