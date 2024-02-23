#!/bin/sh

function exec_once()
{
    pgrep $1 || $@ &
}

exec_once dwmblocks
exec_once picom
