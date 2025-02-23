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

export ANDROID_HOME="$XDG_DATA_HOME"/android
export ANDROID_USER_HOME="$XDG_DATA_HOME"/android
export ANDROID_AVD_HOME="$ANDROID_HOME"/avd

export CARGO_HOME="$XDG_DATA_HOME"/cargo
export CHROME_EXECUTABLE=/usr/bin/google-chrome-beta

export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker

export EDITOR=nvim

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

export XCURSOR_PATH="$XDG_DATA_HOME"/icons

export WINEPREFIX="$XDG_DATA_HOME"/wine

if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    export MOZ_ENABLE_WAYLAND=1
    export QT_QPA_PLATFORM=wayland
fi

if [ -z $PREFIX ]; then
    export PREFIX=/usr
fi

if command -v nvim &>/dev/null; then
    export MANPAGER='nvim +Man!'
fi

append_path "/usr/local/sbin"
append_path "/usr/local/bin"
append_path "/usr/local/games"
append_path "/usr/bin"
append_path "/bin"
append_path "/opt/msvc/bin/x64"
append_path "$HOME"/.local/bin

append_path "$ANDROID_HOME"/build-tools/34.0.0
append_path "$ANDROID_HOME"/cmdline-tools/latest/bin
append_path "$ANDROID_HOME"/emulator
append_path "$ANDROID_HOME"/platform-tools

append_path "$FLUTTER_HOME"/bin
append_path "$HOME"/.pub-cache/bin

unset -f append_path

export PATH
