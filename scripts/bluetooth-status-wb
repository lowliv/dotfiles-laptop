#!/bin/bash

while true; do
    # Get info of connected Bluetooth device
    BT_INFO=$(bluetoothctl info)

    # Extract the device name
    NAME=$(echo "$BT_INFO" | grep -i "Name" | awk -F ': ' '{print $2}')

    # Check connection status
    if echo "$BT_INFO" | grep -q "Connected: yes"; then
        STATE="connected"
        # Extract battery level if available (only the hex value, discard "(100)" part)
        BATTERY=$(echo "$BT_INFO" | grep -i "Battery Percentage" | awk -F ': ' '{print $2}' | sed 's/ .*//')  # Get only the hex part

        # If battery is in hexadecimal (e.g., 0x64), convert to decimal
        if [[ "$BATTERY" =~ ^0x[0-9A-Fa-f]+$ ]]; then
            BATTERY_DECIMAL=$((16#${BATTERY//0x/}))  # Convert from hex to decimal
            BATTERY="${BATTERY_DECIMAL}%"            # Append percent
        fi
        
        BATTERY=${BATTERY:-"unknown"}
        
        # Append ': ' to the name if the device is connected
        if [ -n "$NAME" ]; then
            NAME="$NAME: "
        fi
    else
        # If not connected, check the Bluetooth powered state
        BT_POWERED=$(bluetoothctl show | grep -q "Powered: yes" && echo "on" || echo "off")
        if [ "$BT_POWERED" = "on" ]; then
            STATE="disconnected"
            BATTERY="On"
        else
            STATE="off"
            BATTERY="Off"
        fi
        NAME=""  # No name to append when not connected
    fi

    # Output JSON for Waybar with Name, Battery, and State
    echo "{\"text\":\"$NAME$BATTERY\",\"alt\":\"$STATE\",\"class\":\"none\"}"

    # Prevent excessive CPU usage with a delay
    sleep 5
done
