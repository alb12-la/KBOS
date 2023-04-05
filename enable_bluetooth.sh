#!/bin/bash 

file=~/.sleepscripts/recent.txt

blueutil --power 1

# loop through addresses and make an attempt to connect to each of them

while read line; do 
	blueutil --connect $line; 
done < $file


# Uncomment to debug
# echo "[$(date)] :attempting to enable bluetooth" >> ~/bluetooth.log
