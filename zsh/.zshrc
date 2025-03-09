. ~/.config/zsh/.zshenv

if command -v fastfetch >/dev/null; then
    fastfetch
elif command -v neofetch >/dev/null; then
    neofetch
fi

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

fpath=(~/.config/zsh/modules/zsh-completions/src $fpath)

# Includes
    source ~/.config/zsh/other_stuff/aliases.sh
    source ~/.config/zsh/other_stuff/functions.sh

## ZSH Theme + Plugins ##
    source ~/.config/zsh/modules/powerlevel10k/powerlevel10k.zsh-theme
    [[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

    source ~/.config/zsh/modules/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
    source ~/.config/zsh/modules/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
    source ~/.config/zsh/modules/zsh-history-substring-search/zsh-history-substring-search.zsh
    setopt HIST_IGNORE_ALL_DUPS

## ZSH keys ##
    ## Home and End
    bindkey "^[[H"    beginning-of-line
    bindkey "^[[F"    end-of-line
    # Ctrl Left and Right
    bindkey "^[[1;5C" forward-word
    bindkey "^[[1;5D" backward-word

    ## Page up and down
    bindkey "^[[5~"   history-substring-search-up
    bindkey "^[[6~"   history-substring-search-down

compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"

if command -v zoxide >/dev/null; then
    # Welp we're not gonna be using the direct alias from zoxide
    # as that causes a recursion(?) error in their older versions
    # only noticed this in LMDE
    eval "$(zoxide init zsh)"
    alias cd="z"
    alias cdi="zi"
fi
