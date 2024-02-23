neofetch --source ~/.config/neofetch/logo
. ~/.config/zsh/.zshenv

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

# Includes
    source ~/.config/zsh/other_stuff/aliases.sh
    source ~/.config/zsh/other_stuff/functions.sh

## ZSH Theme + Arch Packagaes for ZSH I just found ##
    source $PREFIX/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
    source $PREFIX/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
    source $PREFIX/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
    source $PREFIX/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
    [[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh


## ZSH keys ##
    bindkey "^[[H"    beginning-of-line
    bindkey "^[[F"    end-of-line
    bindkey "^[[1;5C" forward-word
    bindkey "^[[1;5D" backward-word

compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"

if command -v zoxide &>/dev/null; then
    eval "$(zoxide init --cmd cd zsh)"
fi
