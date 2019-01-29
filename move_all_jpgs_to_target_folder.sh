#!/bin/bash
# move all jpgs in current directory and sub directory to a target folder

find . -name '*.jpg' -exec mv {} target/ \;
