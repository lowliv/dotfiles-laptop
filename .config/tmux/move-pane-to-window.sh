#!/bin/bash

# Check if a window index is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <window_index>"
  exit 1
fi

WINDOW_INDEX="$1"

# Save the currently focused window and pane index
CURRENT_WINDOW=$(tmux display-message -p '#{window_index}')
CURRENT_PANE=$(tmux display-message -p '#{pane_id}')

# Check if window exists
WINDOW_EXISTS=$(tmux list-windows -F '#{window_index}' | grep -Fxq "$WINDOW_INDEX" && echo 'yes' || echo 'no')

# If the window doesn't exist, create it
if [ "$WINDOW_EXISTS" = 'no' ]; then
  tmux new-window -t "$WINDOW_INDEX"
fi

# Focus on the target window
tmux select-window -t "$WINDOW_INDEX"

# Move the active pane from the original window to the target window
tmux move-pane -s "$CURRENT_WINDOW.$CURRENT_PANE" -t "$WINDOW_INDEX.1"

# If the window was newly created, kill the initial empty pane
if [ "$WINDOW_EXISTS" = 'no' ]; then
  tmux kill-pane -t "$WINDOW_INDEX.1"
fi
