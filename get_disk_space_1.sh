#!/bin/bash
# get the remaining disk space

dt=`date +%D`

df -h > /tmp/du$$

while read line
do
    fields=`echo $line | awk '{print NF}'`
    case $fields in
    5) echo -n "$dt "
        echo $line | awk '{print $5,$4}';;
    6) echo -n "$dt "
        echo $line | awk '{print $6,$5}';;
    esac
done < /tmp/du$$

rm /tmp/du$$
