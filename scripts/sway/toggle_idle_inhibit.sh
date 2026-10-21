#!/usr/bin/env bash

focused_window=$(swaymsg -rt get_tree | jq -r '.. | select(.focused?)')

focused_window_id=$(echo $focused_window | jq -r '.id')
focused_window_name=$(echo $focused_window | jq -r '.app_id')

id_file="/tmp/.window_inhibit_idle_$focused_window_id"

is_inhibiting_idle=$(echo $focused_window | jq -r '.inhibit_idle')

notify() {
    notify-send \
        --category 'system' \
        --urgency low \
        --transient \
        --print-id \
        --replace-id "${notification_id:-0}" \
        "$@" > "$id_file"
}

if [[ $is_inhibiting_idle == 'false' ]]; then
    swaymsg 'inhibit_idle visible'
    notify "$focused_window_name" "window is now inhibiting idle"
else
    swaymsg 'inhibit_idle none'
    notify "$focused_window_name" "window stopped inhibiting idle"
fi
