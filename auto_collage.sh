#!/bin/bash

#-------------AUTO COLLAGE by CRASH----------------
#creates a folder with full resolution and low resolution thumbnails (9 each) & makes a full resolution collage along with low resolution collage images.
#USAGE : ./auto_collage.sh film.mkv

#package requirements
#install ffmpeg (which should install ffprobe) & imagemagick using the following command in *buntu
#sudo apt install ffmpeg* imagemagick* -y

if [ -z "$1" ]; then
echo "You have to specify a video file"
exit 1
fi

video="$1"
NUMBEROFSCREENS=9
FOLDER=Auto_Thumbnails
DURATION=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$video")
#DURATION=$(ffprobe -v error -select_streams v:0 -show_entries stream=duration -of default=noprint_wrappers=1:nokey=1 "$video")
if [ $DURATION !$x "N/A" ]; then
DURATION=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$video")
fi
if [ -z $DURATION ] || [ $DURATION == "N/A" ]; then
echo "Could not get video duration"
exit 1
fi
DURATION=${DURATION%.*}
mkdir $FOLDER
echo "===================================================================="
echo "Generating screens for $video (duration: $DURATION)"


for ((n=1;n<$(($NUMBEROFSCREENS + 1));n++)); do
SECONDS=$(( $DURATION / $NUMBEROFSCREENS * $n ))
SECONDS=$((SECONDS<DURATION-10?SECONDS:DURATION-10))

FRAMENAME="$FOLDER/auto_thumbnail_$(printf '%03d' ${n}).png"
ORIG_FRAMENAME="$FOLDER/orig_thumbnail_$(printf '%03d' ${n}).png"
MINUTES=$(( SECONDS / 60 ))
TRAILSECONDS=$(( SECONDS % 60 ))
TIMECODE=$(printf "%02d\:%02d" ${MINUTES} ${TRAILSECONDS})

BLACKCHECK="X"
while [ "$BLACKCHECK" != "" ]; do
  echo "Getting image #$n  ($SECONDS/$DURATION) seconds"

 #Low Resolution Thumbnail
 BLACKCHECK=$(ffmpeg -y -ss $SECONDS -i "$video" -vframes 1 -vf "scale=360:ow/dar, blackframe=90:80, drawtext=text='$TIMECODE': fontcolor=white: fontsize=10: box=1: boxcolor=black@0.5: boxborderw=5: x=w-text_w-15: y=15" $FRAMENAME 2>&1 | grep blackframe)

 #Full Resolution Thumbnail
 BLACKCHECK=$(ffmpeg -y -ss $SECONDS -i "$video" -vframes 1 -vf "blackframe=90:80, drawtext=text='$TIMECODE': fontcolor=white: fontsize=20: box=1: boxcolor=black@0.5: boxborderw=5: x=w-text_w-15: y=15" $ORIG_FRAMENAME 2>&1     | grep blackframe)
  ((SECONDS==DURATION-10)) && break;
  SECONDS=$(( SECONDS + 1 ))
done
done

OUTPUTFILE=AutoCollage_lowres.${video}.png
OUTPUTFILE2=AutoCollage_highres.${video}.png
montage $FOLDER/auto* -interlace Plane -background black -tile 3x -geometry +4+4 -border 5 "$OUTPUTFILE"
montage $FOLDER/orig* -interlace Plane -background black -tile 3x -geometry +4+4 -border 5 "$OUTPUTFILE2"
#rm -r $FOLDER
