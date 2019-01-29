#!/bin/bash
#ffmpeg mp4 to webm

ffmpeg -hide_banner -i input.mp4 -c:v libvpx -crf 10 -qmax 50 -b:v calculated_bitrate -slices 8 -deadline good -cpu-used 5 -an -pass 1 -f webm /dev/null
ffmpeg -hide_banner -i input.mp4 -c:v libvpx -crf 10 -qmax 50 -b:v calculated_bitrate -slices 8 -deadline good -cpu-used 0 -tune ssim -auto-alt-ref 1 -lag-in-frames 25 -arnr-maxframes 5 -arnr-strength 3 -an -pass 2 output.webm

calculated_bitrate = file_size_limit_in_MB * 8 * 1000 / length_in_sec
