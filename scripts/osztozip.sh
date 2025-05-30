#!/bin/bash

# Ensure the script gets one argument: the target directory
if [ $# -ne 1 ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

TARGET_DIR="$1"

# Check if the target directory exists
if [ ! -d "$TARGET_DIR" ]; then
    echo "Directory '$TARGET_DIR' does not exist."
    exit 2
fi

# Loop through all .osz files in the target directory
for file in "$TARGET_DIR"/*.osz; do
    # Skip if no .osz files are found
    if [ ! -e "$file" ]; then
        echo "No .osz files found in '$TARGET_DIR'."
        break
    fi

    # Get the base name of the file (without the path and extension)
    base_name=$(basename "$file" .osz)

    # Define the new file name with the .zip extension
    new_name="$TARGET_DIR/$base_name.zip"

    # Rename the file
    mv "$file" "$new_name"

    # Check if the rename was successful
    if [ $? -eq 0 ]; then
        echo "Renamed '$file' to '$new_name'."
    else
        echo "Failed to rename '$file'."
    fi
done

echo "All done!"

