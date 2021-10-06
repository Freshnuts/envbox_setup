#!/bin/bash

# Bluetooth - my earbuds
# coproc allows interprocess communication.

bluetooth_device=$1

if [ $# != 1 ]
then
	echo
	echo -e 'Bluetooth Connector'
	echo -e 'Usage: blue <device name>\n'
	exit
fi

echo -e "\nBluetooth Connector."
echo -e "\n1. Connect\n2. Disconnect\n3. Exit"
echo -en ">: "
read answer

if [ $answer == 1 ]
then
	coproc bluetoothctl
	echo -e '\nPairing:...'
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
	bt_search=$(bluetoothctl devices | grep -i "$1" | cut -d' ' -f2)
	bluetoothctl remove $bt_search
	
elif [ $answer == 3 ]
then
	exit
else
	echo -e 'Error\n'
fi
