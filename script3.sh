#!/bin/bash

# Prompt the user for a directory name
read -p "Introdu numele unui folder: " dir 

# Search for the directory within a specific path (e.g., ~/Desktop/curs)
find=$(find ~/Desktop/curs -type d -name "$dir") 

# Check if the directory exists
if [ -n "$find" ]; then
	echo "Directory found: $find"
	ls -lah "$find"

    # Get the size of the directory in kilobytes
    folder_size=$(du -sk "$find" | cut -f1)
    
    # Get the available disk space in kilobytes where the folder is located
    available_space=$(df -k --output=avail "$find" | tail -1)
    
    # Calculate the percentage (folder size / available space) * 100
    percentage=$(echo "scale=2; ($folder_size / $available_space) * 100" | bc)
    
    # Display the size and percentage
    echo "Folder size: $(du -sh "$find" | cut -f1)"
    echo "Available space: $(df -h --output=avail "$find" | tail -1)"
    echo "The folder uses $percentage% of the available disk space."
else
	echo "Directory not found."
fi
