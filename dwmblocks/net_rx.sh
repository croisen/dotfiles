#!/bin/sh


function convert_bytes_eh()
{
    input=$1
    res="$(echo $input | awk '{\
        some_log=log($1)/log(10);
        if (some_log > 9) {
            { printf "%f %s", ($1 / 1000000000), "GB"; exit 0 }
        }
        if (some_log > 6) {
            { printf "%f %s", ($1 / 1000000), "MB"; exit 0}
        }
        if (some_log > 3) {
            { printf "%f %s", ($1 / 1000), "KB"; exit 0 }
        }
        { printf "%f %s", $1, "B"; exit 0 }
    }')"
    
    printf "$res"
}

prev_rx=0

if [[ -e /tmp/dwmblocks_croi_script_net_rx ]]; then
    prev_rx=$(cat /tmp/dwmblocks_croi_script_net_rx | head -n1)
fi

rx=$(cat /sys/class/net/$1/statistics/rx_bytes)
new_rx=$((rx - prev_rx))


echo "$rx" > /tmp/dwmblocks_croi_script_net_rx
printf "%6.2f%3s" $(convert_bytes_eh $new_rx)
