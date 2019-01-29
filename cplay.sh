#!/bin/sh
# selecting an mp3 file will automatically start a new instance of cmus

if ! pgrep -x cmus ; then
  xterm -e cmus
else
  cmus-remote -u
fi
