#!/bin/sh


free |\
    awk '/^Mem/ { printf "%3.0f%%", (($3 / $2) * 100 ) }'
