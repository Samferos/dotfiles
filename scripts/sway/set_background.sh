#!/bin/sh

umask 077

BACKGROUNDS_FOLDER=$HOME/Pictures/Backgrounds

ls $BACKGROUNDS_FOLDER --color=none --format single-column \
	> "/tmp/.${USER}_backgrounds"

CHOICE=$(rofi -dmenu < "/tmp/.${USER}_backgrounds")

if [[ -z $CHOICE ]]; then
	exit 1;
fi

ln -sf $BACKGROUNDS_FOLDER/$CHOICE $HOME/.background

matugen image $BACKGROUNDS_FOLDER/$CHOICE
