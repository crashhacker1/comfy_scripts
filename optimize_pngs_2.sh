#!/bin/bash
# another optimize all pngs in the current directory

ls *.png | cut -d . -f 1 | xargs -L1 -i convert -strip -interlace Plane -quality 80 {}.png {}.jpg
