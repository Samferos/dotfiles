#!/bin/sh

ID_FILE=/tmp/.touchpad_notification

TOUCHPAD_ENABLED=$(swaymsg -rt get_inputs | \
	jq -r '.[] | select(.type == "touchpad").libinput.send_events')

ID=$(cat $ID_FILE)

if [[ $TOUCHPAD_ENABLED == "enabled" ]]; then
	notify-send \
		--category 'system' \
		--urgency low \
		--transient \
		--print-id \
		--replace-id ${ID:-0} \
		'Touchpad disabled' > $ID_FILE
	swaymsg 'input type:touchpad events disabled'
else
	notify-send \
		--category 'system' \
		--urgency low \
		--transient \
		--print-id \
		--replace-id ${ID:-0} \
		'Touchpad enabled' > $ID_FILE
	swaymsg 'input type:touchpad events enabled'
fi
