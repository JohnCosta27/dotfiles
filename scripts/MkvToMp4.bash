#!/bin/bash

# Check if exactly one argument was provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <argument>"
    exit 1
fi

# Assign the argument to a variable for better readability
ARGUMENT="$1"
#
# Remove the last 3 characters (.txt) and append .md instead
NEW_FILENAME="${ARGUMENT%.mkv}.mp4"

# Insert your long command here, using $ARGUMENT where the user's input is needed
ffmpeg -i "$ARGUMENT" -vcodec copy -acodec copy "${NEW_FILENAME}"
