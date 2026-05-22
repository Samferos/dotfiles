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
ACTION=$(notify-send --app-name='Screenshot Tool' --action='default=View' "Screenshot copied to clipboard $FILE")
case $ACTION in
    default)
	xdg-open $FILE
	;;
esac

flock --unlock 4
