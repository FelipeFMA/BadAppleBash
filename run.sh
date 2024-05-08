#!/bin/bash
# Original code: Nguyen Khac Trung Kien
# Fork by: Felipe Avelar

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

echo

if [ "$1" ]; then
  speed=$1
else
  speed=1.0
fi

read -p "Do you want to use mpv to play sound? You need mpv installed to do that. (y/n): " choice
if [[ $choice =~ ^[Yy]$ ]]; then
  # Check if mpv is installed
  if ! command -v mpv &> /dev/null; then
    echo
    echo "mpv is not installed. Please install it to use this feature."
    exit 1
  fi
  mpv --no-video bad_apple.mp4 > /dev/null 2>&1 &
fi

dir="$SCRIPT_DIR/frames-ascii"

clear

for filename in $(ls -v "$dir"); do
    tput cup 0 0
    file="$dir/$filename"
    if [ -f "$file" ]; then
        cat "$file"
    fi

    sleep 0.024
done
