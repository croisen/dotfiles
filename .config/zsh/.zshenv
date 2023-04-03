export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_STATE_HOME=${XDG_STATE_HOME:="$HOME/.local/state"}

export ANDROID_HOME="$XDG_DATA_HOME"/android
export ERRFILE="$XDG_CACHE_HOME"/X11/xsession-errors
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export ICEAUTHORITY="$XDG_CACHE_HOME"/ICEauthority
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
export WINEPREFIX="$XDG_DATA_HOME"/wine

export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"
export HOMEBREW_CELLAR="/home/linuxbrew/.linuxbrew/Cellar"
export HOMEBREW_REPOSITORY="/home/linuxbrew/.linuxbrew/Homebrew"
export PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$HOME/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
export MANPATH="/home/linuxbrew/.linuxbrew/share/man${MANPATH+:$MANPATH}:"
export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:${INFOPATH:-}"

if [[ -f $XDG_CONFIG_HOME/python/pythonrc ]]; then
    export PYTHONSTARTUP="$XDG_CONFIG_HOME"/python/pythonrc
else
    mkdir "$XDG_CONFIG_HOME"/python
    curl -s https://raw.githubusercontent.com/croisen/dotfiles/main/pythonrc >> $HOME/pythonrc
    mv $HOME/pythonrc "$XDG_CONFIG_HOME"/python
    rm $HOME/.python_history 2>/dev/null
    export PYTHONSTARTUP="$XDG_CONFIG_HOME"/python/pythonrc
fi
