#!/bin/bash
# convert m4a to mp3 files in the current folder

find ./ -name '*.m4a' -exec bash -c 'ffmpeg -i "$0" -acodec libmp3lame -ab 256k -cpu-used 5 -threads 8 "${0%%.m4a}.mp3"' {} \;
