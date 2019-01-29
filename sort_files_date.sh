#!/bin/bash
# sort files in a folder by date

FINDDATE() { LOCATION="${1:-.}"; find ${LOCATION} -type f -print0 | xargs -0 stat -c "%y %n" | sort | sed 's/.\([0-9]\)\{9,\} +0[1-2]00/\t/' | sed 's/ /\t/g' }
