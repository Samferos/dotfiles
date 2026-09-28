#!/usr/bin/env bash

# swaps or renames a workspace

wanted_workspace=$(swaymsg -rt get_workspaces | jq -r '.[].name' | rofi -dmenu -p 'workspace')

focused_workspace=$(swaymsg -rt get_workspaces | jq -r '.[] | select(.focused == true).name')

echo "Swapping $focused_workspace with $wanted_workspace"

if [[ $wanted_workspace == $focused_workspace ]] then
    echo "Same workspaces in swap operation"
    exit 0
fi

swaymsg "rename workspace $wanted_workspace to _swap"
swaymsg "rename workspace $focused_workspace to $wanted_workspace"
swaymsg "rename workspace _swap to $focused_workspace"
