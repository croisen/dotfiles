#!/bin/sh


# Sample cat /proc/stat
#1    2       3      4       5         6      7     8        9      10     11
     #user    nice   system  idle      iowait irq   softirq  steal  guest  guest_nice
#cpu  74608   2520   24433   1117073   6176   4054  0        0      0      0

#

prev_full=0
prev_idle=0

if [[ -e /tmp/dwmblocks_croi_script_cpu ]]; then
    PREV_CPU=$(cat /tmp/dwmblocks_croi_script_cpu)
    prev_full=$(echo "$PREV_CPU" | awk '{ printf $2+$3+$4+$5+$6+$7+$8+$9 }')
    prev_idle=$(echo "$PREV_CPU" | awk '{ printf $5+$6 }')
fi

CPU=$(cat /proc/stat | head -n1)
full=$(echo "$CPU" | awk '{ printf $2+$3+$4+$5+$6+$7+$8+$9 }')
idle=$(echo "$CPU" | awk '{ printf $5+$6 }')

new_idle=$(($idle-$prev_idle))
new_full=$(($full-$prev_full))

echo "$CPU" > /tmp/dwmblocks_croi_script_cpu
printf "%3.0f%%" $(echo $((new_full-new_idle)) $new_full |\
    awk ' { printf 100 * ($1 / $2) } ')
