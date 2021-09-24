#!/bin/bash

# Bluetooth - my earbuds
# coproc allows input to another process and can relays output.

echo -e "\nBluetooth Earbuds."
echo -e "\n1: Connect\n2: Disconnect"

read answer

if [ $answer == 1 ]
then
	coproc bluetoothctl
	echo -e 'scan on\n'  >&${COPROC[1]}
	sleep 3
	echo -e 'exit\n' >&${COPROC[1]}

	# output=$(cat <&${COPROC[0]})
	# echo $output

	tozo=$(bluetoothctl devices | grep -i 'tozo-t6' | cut -d' ' -f2)
	bluetoothctl pair $tozo
	bluetoothctl connect $tozo

elif [ $answer == 2 ]
then
	tozo=$(bluetoothctl devices | grep -i 'tozo-t6' | cut -d' ' -f2)
	bluetoothctl remove $tozo

else
	echo -e 'Error\n'
fi

