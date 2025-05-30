#!/bin/bash

# Continuously output brightness in JSON format
while true; do
    # Get the current brightness percentage
    brightness=$(xbacklight -get | awk '{printf "%.0f", $1}')

    # Determine the "alt" value based on brightness level
    if [ "$brightness" -ge 80 ]; then
        alt="high"
    elif [ "$brightness" -ge 40 ]; then
        alt="medium"
    elif [ "$brightness" -ge 10 ]; then
        alt="low"
    else
        alt="very_low"
    fi

    # Output JSON for Waybar
    echo "{\"text\": \"${brightness}\", \"alt\": \"$alt\", \"tooltip\": \"\", \"class\": \"none\"}"

    # Sleep for 1 second before the next update
    sleep 1
done
