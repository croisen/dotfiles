neofetch --source ~/.config/neofetch/logo

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
	source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=$HOME/.config/zsh/zsh_hist
HISTSIZE=5000
SAVEHIST=5000
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename /home/andrew/.config/zsh/.zshrc

autoload -Uz compinit
compinit
# End of lines added by compinstall

## Aliases ##
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

# Neofetch
    #alias neofetch='neofetch --ascii "$(echo "Say my name." | cowsay -f ~/.config/neofetch/walter.white -W 30)"'
    alias neofetch='neofetch --source ~/.config/neofetch/logo'

# Pacman and yay
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
    fi

    if command -v yay &>/dev/null; then
        alias pacinst='yay -S'
        alias pacsear='yay -Ss'
        alias pacupdt='yay -Syu'
        alias pacremv='yay -Rsu'
        alias pacsear='yay -Ss'
        alias paclist='yay -Qs'
    fi

# Python :)
    #alias py='python3'

# Steam Games
    if command -v steam &>/dev/null; then
        alias toram_online='steam steam://rungameid/1827180'
    fi

# Suckless compile
    alias suck='sudo make clean install'

# Weather cURL
    alias weather='curl wttr.in/cavite'

#Yarn
    if [[ -n $XDG_CONFIG_HOME ]]; then
        alias yarn="yarn --use-yarnrc $XDG_CONFIG_HOME/yarn/config"
    fi

## Functions ##
# albumart_mk - adds a specified picture as an album art for an mp3 file (requires ffmpeg)
albumart_mk() {
    if ! command -v ffmpeg &>/dev/null; then
        echo "ffmpeg cannot be found, please install it"
        return 1
    fi

    if [[ -z $1 ]]; then
        echo "Usage: albumart_mk file.mp3 album_pic.png"
        return 0
    fi

    ffmpeg -i $1 -i $2 -map 0:0 -map 1:0 -codec copy -id3v2_version 3 \
        -metadata:s:v title="Album cover" -metadata:s:v comment="Cover (front)" modified_$1
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

#ytmp* - Downloads music and videos from sites supported by yt-dlp (i.e. YouTube)
ytmp3() {
	if ! command -v yt-dlp &>/dev/null; then
		echo "yt-dlp cannot be found, please get it"
		return 1
	fi
    for arg in $@; do
        yt-dlp -x --audio-format mp3 \
            --audio-quality 0 \
            --embed-thumbnail \
            -o %\(title\)s.%\(ext\)s "$arg"
    done
	return 0
}

ytmp4() {
	if ! command -v yt-dlp &>/dev/null; then
		echo "yt-dlp cannot be found, please get it"
		return 1
	fi

    for arg in $@; do
        yt-dlp --format mp4 \
            --embed-thumbnail \
            -o %\(title\)s.%\(ext\)s "$arg"
    done
	return 0
}

## ZSH Theme + Arch Packagaes for ZSH I just found ##
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
    source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
    source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
    source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
    [[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh


## ZSH keys ##
    bindkey "^[[H"    beginning-of-line
    bindkey "^[[F"    end-of-line
    bindkey "^[[1;5C" forward-word
    bindkey "^[[1;5D" backward-word

compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"
