#!/bin/bash
# convert mp4 to webm

find ./ -name '*.mp4' -exec bash -c 'ffmpeg -i "$0" -vcodec libvpx -acodec libvorbis -cpu-used 5 -threads 8 "${0%%.mp4}.webm"' {} \;
