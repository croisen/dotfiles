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

prev_tx=0

if [[ -e /tmp/dwmblocks_croi_script_net_tx ]]; then
    prev_tx=$(cat /tmp/dwmblocks_croi_script_net_tx | head -n1)
fi

tx=$(cat /sys/class/net/$1/statistics/tx_bytes)
new_tx=$((tx - prev_tx))


echo "$tx" > /tmp/dwmblocks_croi_script_net_tx
printf "%6.2f%3s" $(convert_bytes_eh $new_tx)
