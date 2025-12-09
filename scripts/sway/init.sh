#!/bin/sh

if [[ -e $HOME/.background ]]; then
	notify-send --category "system" "Please choose a background";
	if ! $HOME/.config/scripts/sway/set_background.sh; then
		notify-send --category "system" "Background was not set";
		exit 1;
	fi
fi
