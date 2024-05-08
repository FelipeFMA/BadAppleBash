#!/bin/bash
# Original code: Nguyen Khac Trung Kien
# Fork by: Felipe Avelar

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
echo "The directory of the currently executing script is: ${SCRIPT_DIR}"

if [ "$1" ]; then
  speed=$1
else
  speed=1.0
fi

read -p "Do you want to use mpv to play sound? You need mpv installed to do that. (y/n): " choice
if [[ $choice =~ ^[Yy]$ ]]; then
  mpv --no-video bad_apple.mp4 > /dev/null 2>&1 &
fi

dir="$SCRIPT_DIR/frames-ascii" 

for filename in $(ls -v "$dir"); do
    tput cup 0 0
    file="$dir/$filename"
    if [ -f "$file" ]; then
        cat "$file"
    fi

    sleep 0.024
done
