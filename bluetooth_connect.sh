#!/bin/bash
# Bluetooth - my earbuds
# coproc allows input to another process and can relays output.

bluetooth_device=$1

if [ $# != 1 ]
then
	echo -e 'Usage: blue <device name>\n'
	exit
fi

echo -e "\nBluetooth Earbuds."
echo -e "\n1: Connect\n2: Disconnect"

read answer

if [ $answer == 1 ]
then
	coproc bluetoothctl
	echo -e 'scan on\n'  >&${COPROC[1]}
	sleep 3
	echo -e 'exit\n' >&${COPROC[1]}

	# For Debugging:
	# output=$(cat <&${COPROC[0]})
	# echo $output

	
	bt_search=$(bluetoothctl devices | grep -i "$1" | cut -d' ' -f2)
	bluetoothctl pair $bt_search
	bluetoothctl connect $bt_search

elif [ $answer == 2 ]
then
	$bt_search	
	bluetoothctl remove $bt_search

else
	echo -e 'Error\n'
fi
