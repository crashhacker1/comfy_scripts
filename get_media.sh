#!/bin/bash
# get all images from a chan board or any basic html page 

exts=(webm mp4 jpeg txt c cpp m py h ppt pptx docx zip tar.gz gif png jpg pdf mp3 sh)
tmpfile=".urls.tmp"
lynx -dump -listonly -nonumbers $1 | sort -u > "$tmpfile"
for ext in ${exts[*]}; do grep "\.$ext$" "$tmpfile" | tee -a $ext\_links.txt | aria2c -i - -d "$ext"; done
rm "$tmpfile"
