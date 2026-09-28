#!/usr/bin/env bash

marks=$(swaymsg -rt get_marks | jq -r '.[]')

target_mark=$(echo -n "$marks" | rofi -dmenu -i -p 'mark')

case "$1" in
    set) swaymsg "mark $target_mark"
        ;;
    remove) swaymsg "unmark $target_mark"
        ;;
    goto) swaymsg "[con_mark=\"$target_mark\"] focus"
        ;;
esac
