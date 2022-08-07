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
	## __git_ps1() It already came with the default
	## installation of git in linux mint, but I dunno about the others so
	## here is what I got from type __git_ps1
	__git_ps1 () {
	    local exit=$?;
	    local pcmode=no;
	    local detached=no;
	    local ps1pc_start='\u@\h:\w ';
	    local ps1pc_end='\$ ';
	    local printf_format=' (%s)';
	    case "$#" in
	        2 | 3)
	            pcmode=yes;
	            ps1pc_start="$1";
	            ps1pc_end="$2";
	            printf_format="${3:-$printf_format}";
	            PS1="$ps1pc_start$ps1pc_end"
	        ;;
	        0 | 1)
	            printf_format="${1:-$printf_format}"
	        ;;
	        *)
	            return $exit
	        ;;
	    esac;
	    local ps1_expanded=yes;
	    [ -z "${ZSH_VERSION-}" ] || [[ -o PROMPT_SUBST ]] || ps1_expanded=no;
	    [ -z "${BASH_VERSION-}" ] || shopt -q promptvars || ps1_expanded=no;
	    local repo_info rev_parse_exit_code;
	    repo_info="$(git rev-parse --git-dir --is-inside-git-dir 		--is-bare-repository --is-inside-work-tree 		--short HEAD 2>/dev/null)";
	    rev_parse_exit_code="$?";
	    if [ -z "$repo_info" ]; then
	        return $exit;
	    fi;
	    local short_sha="";
	    if [ "$rev_parse_exit_code" = "0" ]; then
	        short_sha="${repo_info##*
	}";
	        repo_info="${repo_info%
	*}";
	    fi;
	    local inside_worktree="${repo_info##*
	}";
	    repo_info="${repo_info%
	*}";
	    local bare_repo="${repo_info##*
	}";
	    repo_info="${repo_info%
	*}";
	    local inside_gitdir="${repo_info##*
	}";
	    local g="${repo_info%
	*}";
	    if [ "true" = "$inside_worktree" ] && [ -n "${GIT_PS1_HIDE_IF_PWD_IGNORED-}" ] && [ "$(git config --bool bash.hideIfPwdIgnored)" != "false" ] && git check-ignore -q .; then
	        return $exit;
	    fi;
	    local r="";
	    local b="";
	    local step="";
	    local total="";
	    if [ -d "$g/rebase-merge" ]; then
	        __git_eread "$g/rebase-merge/head-name" b;
	        __git_eread "$g/rebase-merge/msgnum" step;
	        __git_eread "$g/rebase-merge/end" total;
	        if [ -f "$g/rebase-merge/interactive" ]; then
	            r="|REBASE-i";
	        else
	            r="|REBASE-m";
	        fi;
	    else
	        if [ -d "$g/rebase-apply" ]; then
	            __git_eread "$g/rebase-apply/next" step;
	            __git_eread "$g/rebase-apply/last" total;
	            if [ -f "$g/rebase-apply/rebasing" ]; then
	                __git_eread "$g/rebase-apply/head-name" b;
	                r="|REBASE";
	            else
	                if [ -f "$g/rebase-apply/applying" ]; then
	                    r="|AM";
	                else
	                    r="|AM/REBASE";
	                fi;
	            fi;
	        else
	            if [ -f "$g/MERGE_HEAD" ]; then
	                r="|MERGING";
	            else
	                if __git_sequencer_status; then
	                    :;
	                else
	                    if [ -f "$g/BISECT_LOG" ]; then
	                        r="|BISECTING";
	                    fi;
	                fi;
	            fi;
	        fi;
	        if [ -n "$b" ]; then
	            :;
	        else
	            if [ -h "$g/HEAD" ]; then
	                b="$(git symbolic-ref HEAD 2>/dev/null)";
	            else
	                local head="";
	                if ! __git_eread "$g/HEAD" head; then
	                    return $exit;
	                fi;
	                b="${head#ref: }";
	                if [ "$head" = "$b" ]; then
	                    detached=yes;
	                    b="$(
					case "${GIT_PS1_DESCRIBE_STYLE-}" in
					(contains)
						git describe --contains HEAD ;;
					(branch)
						git describe --contains --all HEAD ;;
					(tag)
						git describe --tags HEAD ;;
					(describe)
						git describe HEAD ;;
					(* | default)
						git describe --tags --exact-match HEAD ;;
					esac 2>/dev/null)" || b="$short_sha...";
	                    b="($b)";
	                fi;
	            fi;
	        fi;
	    fi;
	    if [ -n "$step" ] && [ -n "$total" ]; then
	        r="$r $step/$total";
	    fi;
	    local w="";
	    local i="";
	    local s="";
	    local u="";
	    local c="";
	    local p="";
	    if [ "true" = "$inside_gitdir" ]; then
	        if [ "true" = "$bare_repo" ]; then
	            c="BARE:";
	        else
	            b="GIT_DIR!";
	        fi;
	    else
	        if [ "true" = "$inside_worktree" ]; then
	            if [ -n "${GIT_PS1_SHOWDIRTYSTATE-}" ] && [ "$(git config --bool bash.showDirtyState)" != "false" ]; then
	                git diff --no-ext-diff --quiet || w="*";
	                git diff --no-ext-diff --cached --quiet || i="+";
	                if [ -z "$short_sha" ] && [ -z "$i" ]; then
	                    i="#";
	                fi;
	            fi;
	            if [ -n "${GIT_PS1_SHOWSTASHSTATE-}" ] && git rev-parse --verify --quiet refs/stash > /dev/null; then
	                s="$";
	            fi;
	            if [ -n "${GIT_PS1_SHOWUNTRACKEDFILES-}" ] && [ "$(git config --bool bash.showUntrackedFiles)" != "false" ] && git ls-files --others --exclude-standard --directory --no-empty-directory --error-unmatch -- ':/*' > /dev/null 2> /dev/null; then
	                u="%${ZSH_VERSION+%}";
	            fi;
	            if [ -n "${GIT_PS1_SHOWUPSTREAM-}" ]; then
	                __git_ps1_show_upstream;
	            fi;
	        fi;
	    fi;
	    local z="${GIT_PS1_STATESEPARATOR-" "}";
	    if [ $pcmode = yes ] && [ -n "${GIT_PS1_SHOWCOLORHINTS-}" ]; then
	        __git_ps1_colorize_gitstring;
	    fi;
	    b=${b##refs/heads/};
	    if [ $pcmode = yes ] && [ $ps1_expanded = yes ]; then
	        __git_ps1_branch_name=$b;
	        b="\${__git_ps1_branch_name}";
	    fi;
	    local f="$w$i$s$u";
	    local gitstring="$c$b${f:+$z$f}$r$p";
	    if [ $pcmode = yes ]; then
	        if [ "${__git_printf_supports_v-}" != yes ]; then
	            gitstring=$(printf -- "$printf_format" "$gitstring");
	        else
	            printf -v gitstring -- "$printf_format" "$gitstring";
	        fi;
	        PS1="$ps1pc_start$gitstring$ps1pc_end";
	    else
	        printf -- "$printf_format" "$gitstring";
	    fi;
	    return $exit
	}

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
	if ! command -v yt-dlp &>/dev/null; then
		echo "yt-dlp cannot be found, please get it"
		exit 1
	fi

	yt-dlp -x --audio-format mp3 --audio-quality 0 $1
	rename -v 's/ \([\w ]+\)| \[[\w-]+\]//g' *.mp3
	return 0
}

ytmp4() {
	if ! command -v yt-dlp &>/dev/null; then
		echo "yt-dlp cannot be found, please get it"
		exit 1
	fi

	yt-dlp --format mp4 $1
	rename -v 's/ \([\w ]+\)| \[[\w-]+\]//g' *.mp4
	return 0
}
