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
prev_tx=0

if [[ -e /tmp/dwmblocks_croi_script_net_rx_tx ]]; then
    prev_rx=$(cat /tmp/dwmblocks_croi_script_net_rx_tx | head -n1)
    prev_tx=$(cat /tmp/dwmblocks_croi_script_net_rx_tx | tail -n1)
fi

rx=$(cat /sys/class/net/$1/statistics/rx_bytes)
tx=$(cat /sys/class/net/$1/statistics/tx_bytes)
new_rx=$((rx - prev_rx))
new_tx=$((tx - prev_tx))


# Received is displayed first then transmitted
echo "$rx" > /tmp/dwmblocks_croi_script_net_rx_tx
echo "$tx" >> /tmp/dwmblocks_croi_script_net_rx_tx
printf "$2: %6.2f%3s / $3: %6.2f%3s"\
    $(convert_bytes_eh $new_rx) $(convert_bytes_eh $new_tx)
