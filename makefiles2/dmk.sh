#!/bin/bash

echo "Dynamic Makesfile v1 (shell wrapper)"
echo ""

# Check if a Makefile exists in the current directory
if [ ! -f Makefile ]; then
    echo "Error: Makefile not found in the current directory."
    exit 1
fi

# Check if at least one argument is provided
if [ $# -lt 1 ]; then
    echo "Usage: $0 <target> [arguments...]"
    exit 1
fi

# Extract the target
target="$1"
shift

# Pass the rest of the arguments as args to make
make -f Makefile $target args="$*"
