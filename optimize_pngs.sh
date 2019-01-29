#!/bin/bash
# optimize all pngs in the current folder

find . -name *.png | xargs optipng -nc -nb -o7 -full
