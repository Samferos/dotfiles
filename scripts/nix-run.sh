#!/usr/bin/env bash

HISTORY=~/.config/scripts/nix-run.hist

touch $HISTORY

PACKAGE=$(rofi -dmenu -no-show-icons < $HISTORY)

if [[ -z $PACKAGE ]]; then
	exit
fi

notify-send \
	--category 'system' \
	"Nix Run" "Executing ${PACKAGE}..."

if nix run nixpkgs#${PACKAGE}; then
	if ! grep -qw $PACKAGE $HISTORY; then
		echo $PACKAGE >> $HISTORY
	fi
else
	notify-send \
		--category 'system' \
		-u critical \
		"Nix Run" "Failed to execute ${PACKAGE}."
fi
