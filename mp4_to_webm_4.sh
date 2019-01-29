#!/bin/bash
#ffmpeg mp4 to webm

ffmpeg -i u.webm -an -vf scale=720:405 -c:v libvpx -crf 10 -b:v 900K -c:a libvorbis output.webm
