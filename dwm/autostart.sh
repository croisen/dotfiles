#!/bin/sh

function exec_once()
{
    if command -v $1; then
        pgrep $1 || $@ &
    fi
}

exec_once dwmblocks
exec_once picom
exec_once xset -dpms s off
