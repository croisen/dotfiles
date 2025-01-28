#!/bin/sh

# $1 is where this script will gather the wallpapers
IDX=-1

function readIDX() {
    if [ -e ~/.config/hypr/hyprpaper/idx ]; then
        IDX=$(cat ~/.config/hypr/hyprpaper/idx)
    fi
}

function writeIDX() {
    echo "$IDX" > ~/.config/hypr/hyprpaper/idx
}

function getMonitor() {
    hyprctl monitors | grep "Monitor" | awk '{ print $2 }' | head -n1
}

function getWallpaper() {
    readIDX

    COUNT=$(ls "$1" | wc -l)
    IDX=$((( (IDX + 1 ) % COUNT) + 1))
    ls "$1"/* | head -n$IDX | tail -n1

    writeIDX
}

function setWallpaper() {
    WALL="$(getWallpaper $1)"
    MON="$(getMonitor)"
    hyprctl hyprpaper preload "$WALL" &>/dev/null
    hyprctl hyprpaper wallpaper "$MON,$WALL" &>/dev/null
}

if [ -n "$1" ]; then
    setWallpaper "$1"
fi
