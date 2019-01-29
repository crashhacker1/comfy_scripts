#!/bin/bash
#ffmpeg mp4 to webm

ffmpeg -threads 8 -ss 00:00.000 -i input.mkv -t 00:30.000 -c copy -c:v libx264 -preset slow -crf 21 -c:a aac -b:a 192k -map_metadata -1 output.mp4
