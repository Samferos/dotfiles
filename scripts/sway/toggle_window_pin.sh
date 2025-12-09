#!/bin/sh

FOCUSED_WINDOW=$(swaymsg -rt get_tree | jq -r '.. | select(.focused?)')

FOCUSED_WINDOW_ID=$(echo $FOCUSED_WINDOW | jq -r '.id')
FOCUSED_WINDOW_NAME=$(echo $FOCUSED_WINDOW | jq -r '.app_id')

ID_FILE=/tmp/.window_pin_$FOCUSED_WINDOW_ID

NOTIFICATION_ID=$(cat $ID_FILE)

WINDOW_PINNED=$(echo $FOCUSED_WINDOW | jq -r '.sticky')

if $WINDOW_PINNED; then
	notify-send \
		--category 'system' \
		--urgency low \
		--transient \
		--print-id \
		--replace-id ${NOTIFICATION_ID:-0} \
		$FOCUSED_WINDOW_NAME \
		'Window was unpinned' > $ID_FILE
	swaymsg 'sticky disable'
else
	notify-send \
		--category 'system' \
		--urgency low \
		--transient \
		--print-id \
		--replace-id ${NOTIFICATION_ID:-0} \
		$FOCUSED_WINDOW_NAME \
		'Window was pinned' > $ID_FILE
	swaymsg 'sticky enable'
fi
