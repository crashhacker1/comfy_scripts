#!/bin/bash
#ffmpeg mp4 to webm

ffmpeg -i input -an -c:v libvpx -b:v 0 -crf 50 -qmin 30 -quality good -threads 4 output
