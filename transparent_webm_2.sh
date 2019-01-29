#!/bin/bash
# convert all mp4, mkv, and images into transparent webms supported in chan boards

ffmpeg -i "1.gif" -c:v libvpx -qmin 0 -qmax 18 -crf 9 -b:v 1400K -quality good -cpu-used 0 -auto-alt-ref 0 -pix_fmt yuva420p -an -sn -metadata title="bonbibonkers" "2.webm"
