#!/bin/bash
# divide all jpgs from the current folder into 300 each so that viewing them is faster 
# instead of viewing 10k together which may fill up the RAM and crash the system

c=1; d=1; mkdir -p NEWDIR_${d}
for jpg_file in *.jpg
do
if [ $c -eq 300 ]
then
d=$(( d + 1 )); c=0; mkdir -p NEWDIR_${d}
fi
mv "$jpg_file" NEWDIR_${d}/
c=$(( c + 1 ))
done
