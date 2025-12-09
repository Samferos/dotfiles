#!/bin/sh

set -e

exec 4<>/tmp/.screenshot.lock
flock --nonblock 4

export FILE="$HOME/Pictures/Screenshots/$(date +%Y%m%d_%H%M%S).png"
case "$1" in
	screen)
		grim $FILE
	;;
	*)
		slurp | grim -g - $FILE
	;;
esac
cat $FILE | wl-copy
notify-send "Screenshot copied to clipboard $FILE"

flock --unlock 4
