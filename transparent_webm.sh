#!/bin/bash
# convert all mp4, mkv, and images into transparent webms supported in chan boards

for f in *.{mp4,mkv,gif,png,jpg};
do ffmpeg -i "$f" -an -c:v libvpx -auto-alt-ref 0 -pix_fmt yuva420p "out/${f%.*}.webm"; done
