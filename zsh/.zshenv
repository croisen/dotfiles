export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_STATE_HOME=${XDG_STATE_HOME:="$HOME/.local/state"}

append_path() {
    case ":$PATH:" in
        *:"$1":*)
            ;;
        *)
            PATH="${PATH:+$PATH:}$1"
    esac
}

#export ANDROID_HOME="$XDG_DATA_HOME"/android

export CARGO_HOME="$XDG_DATA_HOME"/cargo

export EDITOR=nvim

export ERRFILE="$XDG_CACHE_HOME"/X11/xsession-errors

export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle

export ICEAUTHORITY="$XDG_CACHE_HOME"/ICEauthority

export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc

export LESSHISTFILE="$XDG_CACHE_HOME"/less/history

export PYTHONSTARTUP="$XDG_CONFIG_HOME"/python/pythonrc

export XCURSOR_PATH="$XDG_DATA_HOME"/icons

export WINEPREFIX="$XDG_DATA_HOME"/wine

#export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"
#export HOMEBREW_CELLAR="/home/linuxbrew/.linuxbrew/Cellar"
#export HOMEBREW_REPOSITORY="/home/linuxbrew/.linuxbrew/Homebrew"
#export MANPATH="/home/linuxbrew/.linuxbrew/share/man${MANPATH+:$MANPATH}:"
#export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:${INFOPATH:-}"

append_path '/usr/local/sbin'
append_path '/usr/local/bin'
append_path '/usr/local/games'
append_path '/usr/bin'
append_path '/bin'
append_path '/opt/flutter/bin'
append_path '/opt/android-sdk/cmdline-tools/latest/bin'
append_path $HOME'/.local/bin'

export PATH
