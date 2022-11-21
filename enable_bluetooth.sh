#!/bin/bash 
SLEEP_SCRIPTS_DIR=~/.sleepscripts

blueutil --power 1

# Go through PairedDevices.txt and connect 
while read device; do
    blueutil --connect  $device &
done < ${SLEEP_SCRIPTS_DIR}/PairedDevices.txt

# Uncomment to debug
# echo "[$(date)] :attempting to enable bluetooth" >> ~/bluetooth.log
