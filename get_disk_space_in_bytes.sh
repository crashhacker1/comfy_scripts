#!/bin/bash
# get the remaining disk space in bytes

find ./ -user cs16mtech11021 -type f -printf "%s\n" | awk '{t+=$1}END{print t}'

du -smc /home/* | sort -n

du -smc /media/* | sort -n
