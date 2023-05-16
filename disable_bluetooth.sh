#!/bin/bash 

file=~/.sleepscripts/.recent.txt
status=$(blueutil --power)

echo $status > $file

if [ "$status" == "0" ]
then 
	exit 1
else	
	blueutil --connected | grep -oE '[0-9A-Fa-f]{2}(-[0-9A-Fa-f]{2}){5}' >> $file

	blueutil --power 0
fi

# Uncomment to debug
# echo "[$(date)] :attempting to disable bluetooth" >> ~/bluetooth.log