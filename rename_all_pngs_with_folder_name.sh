#!/bin/bash
# rename all pngs in the current dir and subdirs with its folder name

find . -iname '*.png' | while read fn; do name=$(basename "$fn") ; dir=$(dirname "$fn") ; mv "$fn" "$dir/$(basename "$dir")-$name" ;done
