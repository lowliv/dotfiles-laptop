#!/usr/bin/bash

# File to store the last execution timestamp
LAST_RUN_FILE="/tmp/last_run_timestamp"
# Lock file to prevent concurrent execution
LOCK_FILE="/tmp/scroll_action_lock"

# Ensure the script has at least two arguments: delay and the command to execute
if [ "$#" -lt 2 ]; then
    echo "Usage: $0 <delay_in_seconds> <command_to_execute>"
    exit 1
fi

# Get the delay time (first argument) and shift it out of the argument list
delay_time=$1
shift

# Get the current timestamp in nanoseconds
current_time=$(date +%s%N)

# Check if the lock file exists
if [ -f "$LOCK_FILE" ]; then
    # If the lock file exists, exit the script (prevent running concurrently)
    exit 0
else
    # Create the lock file to prevent other instances from running
    touch "$LOCK_FILE"
    
    # Check if the last execution file exists and has a valid timestamp
    if [ -f "$LAST_RUN_FILE" ]; then
        last_run_time=$(cat "$LAST_RUN_FILE")
    else
        last_run_time=0
    fi

    # Calculate the time difference in seconds (using bash arithmetic)
    time_diff=$(echo "scale=9; ($current_time - $last_run_time) / 1000000000" | bc)

    # If the time difference is greater than or equal to the delay, run the command
    if (( $(echo "$time_diff >= $delay_time" | bc -l) )); then
        # Run the command passed as argument
        "$@"

        # Update the last run timestamp
        echo $current_time > "$LAST_RUN_FILE"
    fi

    # Remove the lock file to allow subsequent executions
    rm -f "$LOCK_FILE"
fi
