#!/bin/sh


free |\
    awk '/^Swap/ { printf "%3.0f%%", (($3 / $2) * 100 ) }'
