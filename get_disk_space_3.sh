#!/bin/bash
# get the remaining disk space

tail -28 /var/tmp/du.log



dt=`date +%D`
log="/var/tmp/du.log"

df -h > /tmp/du$$

while read line
do
    fields=`echo $line | awk '{print NF}'`
    case $fields in
    5) echo -n "$dt " >> $log
        echo $line | awk '{print $5,$4}' >> $log;;
    6) echo -n "$dt " >> $log
        echo $line | awk '{print $6,$5}' >> $log;;
    esac
done < /tmp/du$$

rm /tmp/du$$


