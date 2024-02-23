#!/bin/sh


echo $(wpctl get-volume '@DEFAULT_SINK@') |\
    awk -F" " '{ if ($3) { printf "%3d%%M", $2 * 100 }\
    else { printf "%4d%%", $2 * 100 } }'
