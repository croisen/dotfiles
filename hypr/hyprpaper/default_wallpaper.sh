#!/bin/sh

# $1 is where this script will gather the wallpapers
IDX=1 # Not really index, or it is an index if we're talking lua

function getMonitor() {
    hyprctl monitors | grep "Monitor" | awk '{ print $2 }' | head -n1
}

function getWallpaper() {
    COUNT=$(ls "$1" | wc -l)
    ls "$1"/* | head -n$IDX | tail -n1
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
