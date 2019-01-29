#!/bin/bash
# make mp3s in current folder into mp4 with a static image

for name in *.mp3; do ffmpeg -loop 1 -i imagename.jpg -i "$name" -shortest -c:v libx264 -preset ultrafast -c:a copy "${name%.*}.mp4"; done

