#!/bin/bash
# Checks for broken links.
# Requires rake preview to be running.
wget -e robots=off --spider -r -l 8 -o wget_errors.txt http://localhost:4000

EXIT_CODE=$?
if [ $EXIT_CODE -gt 0 ]; then
    echo "ERROR: Found broken link(s):"
    egrep '^http://localhost:4000/' wget_errors.txt
    exit 1
else
    echo "PASS"
    rm ./wget_errors.txt
fi
