#!/bin/sh

# allows updating sway's colors without reloading the entire config

dir="${XDG_CONFIG_HOME:-$HOME/.config}/sway"
colors_file="$dir/colors.matugen"

while read line; do
    # Ignore comments
    if ! echo $line | grep -q '^[^#]'; then
        continue;
    fi
    swaymsg "$line"
done < $colors_file
