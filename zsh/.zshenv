export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_STATE_HOME=${XDG_STATE_HOME:="$HOME/.local/state"}

XDG_DATA_DIRS="$XDG_DATA_DIRS"
append_data_dirs() {
    case ":$PATH:" in
        *:"$1":*)
            ;;
        *)
            XDG_DATA_DIRS="${XDG_DATA_DIRS:+$XDG_DATA_DIRS:}$1"
    esac
}

append_path() {
    case ":$PATH:" in
        *:"$1":*)
            ;;
        *)
            PATH="${PATH:+$PATH:}$1"
    esac
}

export ANDROID_HOME="$XDG_DATA_HOME"/android
export ANDROID_USER_HOME="$XDG_DATA_HOME"/android
export ANDROID_AVD_HOME="$ANDROID_HOME"/avd

export CARGO_HOME="$XDG_DATA_HOME"/cargo
export CHROME_EXECUTABLE=/usr/bin/google-chrome-beta

export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker

export ERRFILE="$XDG_CACHE_HOME"/X11/xsession-errors

export FLUTTER_HOME="$HOME"/git/others/flutter

export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GOPATH="$XDG_DATA_HOME"/go
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle

export ICEAUTHORITY="$XDG_CACHE_HOME"/ICEauthority

export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java

export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
export NUGET_PACKAGES="$XDG_CACHE_HOME"/NuGetPackages

export LESSHISTFILE="$XDG_CACHE_HOME"/less/history

export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass
export PYTHONSTARTUP="$XDG_CONFIG_HOME"/python/pythonrc

export QT_QPA_PLATFORMTHEME=qt5gtk2

export RENPY_PATH_TO_SAVES="$XDG_DATA_HOME"
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR"/ssh-agent.socket

export XCURSOR_PATH="$XDG_DATA_HOME"/icons
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc

export WINEPREFIX="$XDG_DATA_HOME"/wine

if command -v nvim >/dev/null; then
    export EDITOR=nvim
elif command -v vim >/dev/null; then
    export EDITOR=vim
fi

if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    export MOZ_ENABLE_WAYLAND=1
    export QT_QPA_PLATFORM=wayland
fi

if [ -z $PREFIX ]; then
    export PREFIX=/usr
fi

if [ -z $XAUTHORITY ]; then
    export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
fi

append_path "/usr/local/sbin"
append_path "/usr/local/bin"
append_path "/usr/local/games"
append_path "/usr/bin"
append_path "/bin"
append_path "/opt/msvc/bin/x64"
append_path "$HOME"/.local/bin
append_path "$CARGO_HOME"/bin

append_path "$ANDROID_HOME"/build-tools/34.0.0
append_path "$ANDROID_HOME"/cmdline-tools/latest/bin
append_path "$ANDROID_HOME"/emulator
append_path "$ANDROID_HOME"/platform-tools

append_path "$FLUTTER_HOME"/bin
append_path "$HOME"/.pub-cache/bin

append_data_dirs "/usr/share"
append_data_dirs "/usr/local/share"
append_data_dirs "$HOME/.local/share/flatpak/exports/share"

unset -f append_path
unset -f append_data_dirs

export PATH
export XDG_DATA_DIRS
