#!/bin/sh
# convert all avis and mp4 videos in the current folder to gif files

mkdir avi_gif
mkdir mp4_gif
for f in *.mp4; do ffmpeg -i "$f" -t 60 "mp4_gif/${f%.mp4}.gif"; done
for f in *.avi; do ffmpeg -i "$f" -t 60 "avi_gif/${f%.avi}.gif"; done
