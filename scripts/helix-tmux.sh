#!/bin/bash

FILE="$1"

# Ensure file path is properly expanded
if [[ -z "$FILE" ]]; then
    echo "No file provided!"
    exit 1
fi

# Remove single quotes from the file path (if any)
FILE="${FILE//\'/}"

# Get the absolute path of the file
FILE=$(realpath "$FILE")

# Find if Helix is running inside any tmux pane
PANE_ID=$(tmux list-panes -a -F '#{pane_id} #{pane_current_command}' | grep 'helix' | awk '{print $1}' | head -n 1)

if [[ -n "$PANE_ID" ]]; then
    tmux send-keys -t "$PANE_ID" Escape
    # If Helix is running, open the file in a new buffer
    tmux send-keys -t "$PANE_ID" ":o $FILE"
    # sleep 0.1  # Allow Helix to process the command
    tmux send-keys -t "$PANE_ID" Enter
else
    # If Helix is not running, start it in a new tmux window with the file
    tmux new-window -n helix "exec helix $FILE"
fi

