#!/bin/bash

# Check the current power state
CURRENT_STATE=$(bluetoothctl show | grep "Powered" | awk '{print $2}')

if [ "$CURRENT_STATE" = "yes" ]; then
    # Turn off if currently on
    bluetoothctl power off
    echo "Bluetooth turned off"
else
    # Turn on if currently off
    bluetoothctl power on
    echo "Bluetooth turned on"
fi
