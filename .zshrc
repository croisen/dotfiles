if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
	source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=$HOME/.config/zsh/zsh_hist
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/andrew/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

## XDG Stuff by xdg-ninja ##
if [[ -n $XDG_STATE_HOME ]]; then
    export HISTFILE="${XDG_STATE_HOME}"/bash/history
fi

if [[ -n $XDG_DATA_HOME ]]; then
    export GNUPGHOME="$XDG_DATA_HOME"/gnupg
fi

if [[ -n $XDG_CACHE_HOME ]]; then
    alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"
fi

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

## ZSH Theme ##
	source ~/powerlevel10k/powerlevel10k.zsh-theme

	# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
	[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
