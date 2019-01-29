#!/bin/bash
# move all pngs in current directory and sub directory to a target folder

find . -name '*.png' -exec mv {} target/ \;
