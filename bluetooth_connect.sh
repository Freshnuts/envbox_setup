#!/bin/bash

# Bluetooth - my earbuds
# coproc allows input to another process and can relays output.
coproc bluetoothctl
echo -e 'show\nscan on\n'  >&${COPROC[1]}
sleep 3
echo -e 'exit\n' >&${COPROC[1]}

output=$(cat <&${COPROC[0]})
echo $output

tozo=$(bluetoothctl devices | grep -i 'tozo-t6' | cut -d' ' -f2)
bluetoothctl pair $tozo
bluetoothctl connect $tozo
