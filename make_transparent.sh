#!/bin/bash
#Change the background of all the images to transparent

mkdir -p transparent_outputs
for f in *.png; do convert "$f" -fill 'transparent' -fuzz 50% -draw 'color 0,0 floodfill' "transparent_outputs/${f%.png}_transparent1.png"; done
for f in *.jpg; do convert "$f" -fill 'transparent' -fuzz 50% -draw 'color 0,0 floodfill' "transparent_outputs/${f%.jpg}_transparent1.jpg"; done
for f in *.png; do convert "$f" -fill 'transparent' -fuzz 1% -transparent white "transparent_outputs/${f%.png}_transparent2.png"; done
for f in *.jpg; do convert "$f" -fill 'transparent' -fuzz 1% -transparent white "transparent_outputs/${f%.jpg}_transparent2.png"; done
