#!/bin/bash

# Ensure the script gets two arguments: source directory and destination directory
if [ $# -ne 2 ]; then
    echo "Usage: $0 <source_directory> <destination_directory>"
    exit 1
fi

SOURCE_DIR="$1"
DEST_DIR="$2"

# Check if the source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Source directory '$SOURCE_DIR' does not exist."
    exit 2
fi

# Create the destination directory if it does not exist
mkdir -p "$DEST_DIR"

# Loop through all files in the source directory and its subdirectories
find "$SOURCE_DIR" -type f | while read -r file; do
    # Copy each file to the destination directory
    cp "$file" "$DEST_DIR"

    # Check if the copy was successful
    if [ $? -eq 0 ]; then
        echo "Successfully copied '$file' to '$DEST_DIR'."
    else
        echo "Failed to copy '$file'."
    fi
done

echo "All done!"

