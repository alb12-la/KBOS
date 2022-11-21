#!/bin/bash 

# blueutil --disconnect db-a0-7d-17-8e-8e --wait-disconnect db-a0-7d-17-8e-8e
# blueutil --disconnect 74-45-ce-bc-1f-26 --wait-disconnect 74-45-ce-bc-1f-26 
blueutil --power 0

# Uncomment to debug
# echo "[$(date)] :attempting to disable bluetooth" >> ~/bluetooth.log