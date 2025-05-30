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

# Loop through all archive files in the target directory
for archive in "$TARGET_DIR"/*; do
    # Check if the file is an archive (zip, tar, 7z, etc.)
    if [ -f "$archive" ] && [[ "$archive" =~ \.zip$|\.tar$|\.7z$|\.gz$|\.bz2$ ]]; then
        echo "Extracting: $archive"
        
        # Define the target directory for the extracted files (based on the archive name)
        base_name=$(basename "$archive" | sed 's/\(.*\)\..*/\1/')
        extract_dir="$TARGET_DIR/$base_name"

        # Create the extraction directory
        mkdir -p "$extract_dir"

        # Extract the archive based on its type
        case "$archive" in
            *.zip)   unzip -q "$archive" -d "$extract_dir" ;;
            *.tar)   tar -xf "$archive" -C "$extract_dir" ;;
            *.7z)    7z x "$archive" -o"$extract_dir" -y ;;
            *.gz)    gunzip -c "$archive" | tar -x -C "$extract_dir" ;;
            *.bz2)   bunzip2 -c "$archive" | tar -x -C "$extract_dir" ;;
            *)       echo "Unsupported file type: $archive" ;;
        esac

        # Check if the extraction was successful
        if [ $? -eq 0 ]; then
            echo "Successfully extracted '$archive' to '$extract_dir'."
        else
            echo "Failed to extract '$archive'."
        fi
    fi
done

echo "All done!"
