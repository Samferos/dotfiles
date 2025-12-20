#!/bin/sh

LAUNCH_ENTRY=$(rofi -show drun -run-command "uwsm app -- {cmd}")

if [ ! -z $LAUNCH_ENTRY ]; then
    echo $LAUNCH_ENTRY
    uwsm app "$LAUNCH_ENTRY"
fi
