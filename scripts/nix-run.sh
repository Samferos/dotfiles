#!/usr/bin/env bash

HISTORY=~/.config/scripts/nix-run.hist

touch $HISTORY

PACKAGE=$(wofi --show dmenu < $HISTORY)

if [[ -z $PACKAGE ]]; then
	exit
fi

notify-send "Nix Run" "Executing ${PACKAGE}..."
if uwsm app nix run nixpkgs#${PACKAGE}; then
	echo $PACKAGE >> $HISTORY
else
	notify-send -u critical "Nix Run" "Failed to execute ${PACKAGE}."
fi
