if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
	source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=$HOME/.config/zsh/zsh_hist
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename /home/andrew/.zshrc

autoload -Uz compinit
compinit
# End of lines added by compinstall

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

    # Weather cURL
        alias weather='curl wttr.in/cavite'

    #yt-dlp
        alias ytmp3='yt-dlp -x --audio-format mp3 --audio-quality 0'
        alias ytmp4='yt-dlp -f mp4'

## ZSH Theme ##
	source ~/powerlevel10k/powerlevel10k.zsh-theme
	[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"