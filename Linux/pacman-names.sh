#!/bin/bash

# Check if the first argument is the custom flag
if [[ "$1" == "-Sn" ]]; then
    shift  # Remove the custom flag from the arguments
    # Search for package names only
    pacman -Ss "$@" | grep -o '^[^ ]*'
else
    # Pass all arguments to the original pacman command
    /usr/bin/pacman "$@"
fi
