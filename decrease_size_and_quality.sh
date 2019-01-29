for i in *; do convert $i -resize 1024x $i-1024x.jpg; done;
for i in *-1024x.jpg; do convert $i -quality 50% $i-50p.jpg; done;