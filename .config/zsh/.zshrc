if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
	source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=$HOME/.config/zsh/zsh_hist
HISTSIZE=1000
SAVEHIST=1000
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
    fi
fi

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

# Python :)
    alias py='python3'

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

## ZSH Theme ##
	source ~/.config/zsh/powerlevel10k/powerlevel10k.zsh-theme
	[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"
