#!/bin/bash
# find the oldest file form the current directory and sub directories

find -type f -printf '%T+ %p\n' | sort | head -n 1
