#!/bin/bash
# convert all mp4, mkv, and images into transparent webms supported in chan boards

convert -size 1280x720 xc:transparent -background transparent \
    -channel RGBA -fill '#0FF8' \
    -draw 'polygon 200, 600, 200, 20, 600, 50, 600, 50' -fill '#0008' \
    -draw 'polygon 200, 660, 200, 40, 660, 70, 660, 70' -fill '#fFF8' \
    -draw 'polygon 200, 500, 200, 00, 500, 30, 500, 30' -channel RGBA \
    -depth 8 -blur '10x5' test.png

convert -size 1280x720 xc:yellow -background yellow -channel RGBA gnd.png
ffmpeg -loop 1 -i test.png -t 1 -pix_fmt argb -vcodec qtrle z.mov
ffmpeg -loop 1 -i gnd.png -t 1 -pix_fmt argb -vcodec qtrle gnd.mov
ffmpeg -vcodec qtrle -i gnd.mov -vcodec qtrle -i z.mov \
    -filter_complex "[0:0][1:0]overlay=format=rgb[out]" -shortest \
    -map [out] -vcodec qtrle test.mov

#d6daf0
convert 1.gif -coalesce -alpha set -channel RGBA -fill '#d6daf0' -opaque none out.gif
ffmpeg -i out.gif -c:v libvpx -crf 4 -b:v 0 -auto-alt-ref 0 -pix_fmt yuva420p -vf colorkey=#d6daf0 out.webm
