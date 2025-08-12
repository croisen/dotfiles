#!/bin/sh

exec_once()
{
    if command -v $1 >/dev/null; then
        pgrep -f -u $USER $@ || $@ &
    fi
}

exec_once xset -dpms -b s off
exec_once /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
exec_once dunst
exec_once slstatus
