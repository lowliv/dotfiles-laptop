#!/bin/bash

# Path to Waybar processes and configs
CONFIG1="$HOME/.config/waybar/config-icons"
CONFIG2="$HOME/.config/waybar/config-numbers"

# Toggle between configurations using a simple state file
STATE_FILE="/tmp/waybar_toggle_state"

terminate_waybar() {
    WAYBAR_PIDS=$(pgrep -x waybar)
    
    if [ -n "$WAYBAR_PIDS" ]; then
        kill $WAYBAR_PIDS
        while pgrep -x waybar > /dev/null; do
            sleep 1
        done
    fi
}

if [ ! -f "$STATE_FILE" ]; then
    echo "1" > "$STATE_FILE"
fi

terminate_waybar


if grep -q "1" "$STATE_FILE"; then
    echo "2" > "$STATE_FILE"
    waybar -c "$CONFIG2" &
else
    echo "1" > "$STATE_FILE"
    waybar -c "$CONFIG1" &
fi

