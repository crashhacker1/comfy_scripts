#!/bin/sh
# convert all mp4 files in the current folder to mp3 and move them to a new folder mp3_outputs

mkdir mp3_outputs
for f in *.mp4; do ffmpeg -i "$f" -c:a libmp3lame "mp3_outputs/${f%.mp4}.mp3"; done
