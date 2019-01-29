mkdir avis
for f in *.mp4; do ffmpeg -i "$f" -codec copy -threads 8 "avis/${f%.mp4}.avi"; done
