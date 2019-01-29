#!/bin/bash

#list the rows and columns of all files in the folder of given path
#usage : rc.sh /home/user/csv_folder/

cd "$1"
for f in *.{csv,txt,sh,json,py,c,cpp}; do echo -n "$f : " && awk -F",| " 'BEGIN{i=0}!/^$/{i++;}END{print i"x"NF}' "$f"; done

