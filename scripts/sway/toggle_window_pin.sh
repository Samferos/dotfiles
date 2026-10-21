#!/bin/sh

focused_window=$(swaymsg -rt get_tree | jq -r '.. | select(.focused?)')

focused_window_id=$(echo $focused_window | jq -r '.id')
focused_window_name=$(echo $focused_window | jq -r '.app_id')

id_file="/tmp/.window_pin_$focused_window_id"

notification_id=$(cat $id_file)

window_pinned=$(echo $focused_window | jq -r '.sticky')

if $window_pinned; then
    notify-send \
        --category 'system' \
        --urgency low \
        --transient \
        --print-id \
        --replace-id ${notification_id:-0} \
        $focused_window_name \
        'window was unpinned' > $id_file
    swaymsg 'sticky disable'
else
    notify-send \
        --category 'system' \
        --urgency low \
        --transient \
        --print-id \
        --replace-id ${notification_id:-0} \
        $focused_window_name \
        'window was pinned' > $id_file
    swaymsg 'sticky enable'
fi
