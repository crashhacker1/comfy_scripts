#!/bin/bash
# convert mkv to webm

ffmpeg -i /tmp/ll.mkv -vf scale=640:576,sab -aspect 16:9 -map 0:v:0 -c:v libvpx -pix_fmt yuv420p -lag-in-frames 0 -deadline good -cpu-used 0 -keyint_min 48 -slices 1 -static-thresh 10 -g 7200 -threads 4 -qmin 10 -qmax 35 -fs 3M -y /tmp/a.webm
