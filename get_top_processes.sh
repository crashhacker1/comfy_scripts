#!/bin/bash
# get the processes in your system which are taking up more spaces

ps aux | awk '{print $2, $3, $4, $10, $11}' | sort -k2rn | head -n 10

