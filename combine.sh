#!/bin/sh
# move all files with extension .jpg to a folder named combined

mkdir ./combined
find . -name "*.jpg" -exec mv "{}" ./combined \;
