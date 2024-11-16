#!/bin/bash

# Function to get, clean, and truncate the active window title
get_active_window_title() {
    # Get the current playerctl status (Playing, Paused, or other)
    local player_status=$(playerctl status 2>/dev/null)

    # If playerctl status is "Playing" or "Paused", return an empty title
    if [[ "$player_status" == "Playing" || "$player_status" == "Paused" ]]; then
        echo ""
        return
    fi

    # Get the title, remove newline and extra spaces, and filter out "initialTitle:"
    local title=$(hyprctl activewindow | grep -i 'title:' | sed -E 's/.*title:[[:space:]]*//' | sed 's/initialTitle:.*//' | tr -d '\n' | awk '{$1=$1;print}')

    # Escape special JSON characters (backslashes, double quotes, and replace & with &amp;)
    title=$(echo "$title" | sed 's/\\/\\\\/g; s/"/\\"/g; s/&/\&amp;/g')

    # Check if the title is longer than 60 characters and truncate with "..." if needed
    if [ ${#title} -gt 60 ]; then
        title="${title:0:57}..."
    fi

    echo "$title"
}

# Initialize the previous title
previous_title=""

# Infinite loop to monitor the active window title
while true; do
    # Get the current active window title
    current_title=$(get_active_window_title)

    # If the title has changed, update Waybar
    if [[ "$current_title" != "$previous_title" ]]; then
        echo "{\"text\": \"$current_title\", \"class\": \"active-window-title\"}"
        previous_title="$current_title"
    fi

    # Add a slight delay to avoid excessive CPU usage
    sleep 0.1
done
