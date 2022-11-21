#!/bin/bash 
blueutil --power 0

# Add App which quit when lid is closed
osascript -e 'quit app "APP NAME"' #Example: osascript -e 'quit app "HandsFree 2"'

# Uncomment to debug
# echo "[$(date)] :attempting to disable bluetooth" >> ~/bluetooth.log
