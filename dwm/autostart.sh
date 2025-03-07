#!/bin/sh

exec_once()
{
    if [ $# -gt 1 ]; then
        if command -v $1 >/dev/null; then
            pgrep $2 || $@ &
            return
        fi
    else
        if command -v $1 >/dev/null; then
            pgrep $1 || $@ &
            return
        fi
    fi
}

exec_once /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
# exec_once dwmblocks
exec_once slstatus
exec_once picom
# exec_once discord
