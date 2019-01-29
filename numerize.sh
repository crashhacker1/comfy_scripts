#!/bin/bash
# numerize all the files in the current folder

COUNT=1
for file in *; do
    mv "$file" "${COUNT}_$file"
    let COUNT++
done
