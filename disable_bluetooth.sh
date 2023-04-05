#!/bin/bash 

file=~/.sleepscripts/recent.txt

blueutil --connected | grep -oE '[0-9A-Fa-f]{2}(-[0-9A-Fa-f]{2}){5}' > $file

blueutil --power 0

# Uncomment to debug
# echo "[$(date)] :attempting to disable bluetooth" >> ~/bluetooth.log
