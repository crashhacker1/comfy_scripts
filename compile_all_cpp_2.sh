#!/bin/sh
# compile all opencv cpp files in the current folder

for f in "$@"; do
    echo "compiling $f"
    if [[ $f == *.c ]]
    then
        gcc -ggdb `pkg-config --cflags opencv` -o `basename "$f" .c` "$f" `pkg-config --libs opencv`
    elif [[ $f == *.cpp ]]
    then
        g++ -ggdb `pkg-config --cflags opencv` -o `basename "$f" .cpp` "$f" `pkg-config --libs opencv`
    else
        echo "$f is not .c or .cpp file"
    fi
    echo "Output file => ${f%.*}"
done
