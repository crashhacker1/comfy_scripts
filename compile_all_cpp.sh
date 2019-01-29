#!/bin/sh
# compile all cpp files in the current folder mainly opencv cpp files


test -n "$1" || { echo "error: insufficient input, usage :${0##*/} filename.c (cpp)"; exit 1; }

for source in "$@"; do

    ext="${source##*\.}"  # file extension
    fname="${source##*/}" 
    fname="${fname%\.*}"  # base filename (no extension)

    if test "$ext" == "c" ; then

        gcc -ggdb `pkg-config --cflags opencv` \
        -o "$fname" "$source" \
        `pkg-config --libs opencv`

    elif test "$ext" == "cpp" ; then

        g++ -ggdb `pkg-config --cflags opencv` \
        -o "$fname" "$source" \
        `pkg-config --libs opencv`

    else
        echo "Please compile only .c or .cpp files"

    fi

done

exit 0
