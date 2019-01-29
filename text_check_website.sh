#!/bin/bash
# check a certain keyword in a certain website
# USAGE : bash text_check_website.sh www.google.com sign

WEBSITE="$1"
KEYWORD="$2"


wget -E --no-parent --no-directories --no-host-directories "$WEBSITE" 

#for file in *; do
#  test "${file%.*}" = "$file" && mv "$file" "$file".html;
#done

find . -type f -name '*.htm*' | while IFS= read path
do
    lynx -dump -nolist "$path" >"${path%%.htm*}.txt"
done


grep -rain "$KEYWORD" ./*.txt
