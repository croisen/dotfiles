#!/bin/sh

exec_once()
{
    if command -v $1 >/dev/null; then
        pgrep $1 || $@ &
    fi
}

exec_once /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
exec_once slstatus
exec_once picom
exec_once vesktop
