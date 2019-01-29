#!/bin/bash
#  search for a keyword in pdfs from current directory
# USAGE bash search_pdfs.sh artificial

KEYWORD="$1"
pdfgrep -R "$KEYWORD" ./
