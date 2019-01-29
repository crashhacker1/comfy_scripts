#!/bin/bash
# rename all jpgs in current and sub dirs with it's folder name

find . -iname '*.jpg' | while read fn; do name=$(basename "$fn") ; dir=$(dirname "$fn") ; mv "$fn" "$dir/$(basename "$dir")-$name" ;done
