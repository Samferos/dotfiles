#!/bin/sh

LAUNCH_ENTRY=$(wofi --show drun --define=drun-print_desktop_file=true | sed -E "s/(\.desktop) /\1:/")

if [ ! -z $LAUNCH_ENTRY ]; then
    echo $LAUNCH_ENTRY
    uwsm app "$LAUNCH_ENTRY"
fi
