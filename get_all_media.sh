#!/bin/bash

# get all images from a chan board or any basic html page
# packages required : sudo apt install -y lynx* aria* parallel* exiftool* zenity
# usage : get_media.sh
# media will be downloaded in the current directory you're running this command in

if user_input=$(zenity --entry);

then

echo "User has entered links + content"
echo "Extracting only links..."
echo "$user_input" > /tmp/links.txt


# media to download
exts=(webm mp4 jpeg txt c cpp m py h ppt pptx docx zip gz gif png jpg pdf mp3 sh webp avi mkv)

# parallel jobs you want to use (default : half of your cores)
cores_to_use=$(($(nproc)/2))

# extract only URLs from the supplied file consisting of text+content
grep -Eo "(http|https)://[a-zA-Z0-9./?=_%:-]*" < /tmp/links.txt | sort -u > links_clean.txt

# extract media from the URLs
tmpfile=".urls.tmp"
while read url ; do lynx -dump -listonly -nonumbers "$url" | sort -u >> "$tmpfile" ; done < links_clean.txt

# download the extracted media
for ext in "${exts[@]}"; do grep "\.$ext$" "$tmpfile" | tee -a "$ext"_links.txt | aria2c --split="$cores_to_use" --max-connection-per-server="$cores_to_use" --max-concurrent-downloads="$cores_to_use" -c -i - -d "$ext"; done

# clean up
rm ./.urls.tmp
rm ./*.txt*

#moves the media into folders (tree structure) based on the year, month, and day
for d in ./*/ ; do (cd "$d" && exiftool "-Directory<FileModifyDate" -d "%Y/%Y-%m-%d" .); done

fi
