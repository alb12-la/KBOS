#!/bin/bash 

file=~/.sleepscripts/recent.txt
status=$(head -n 1 $file)

if [ "$status" == "1" ]
then
	blueutil --power 1

	# loop through addresses and make an attempt to connect to each of them
	
	i=1
	while read line
	do
        	test $i -eq 1 && ((i=i+1)) && continue
        	blueutil --connect $line
	done < $file
fi


# Uncomment to debug
# echo "[$(date)] :attempting to enable bluetooth" >> ~/bluetooth.log
