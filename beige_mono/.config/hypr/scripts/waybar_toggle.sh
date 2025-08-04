#!/bin/bash
if pgrep -x waybar; then
  killall waybar
  hyprctl keyword general:border_size 2
  hyprctl keyword general:gaps_in 0
	hyprctl keyword general:gaps_out 0
	hyprctl keyword decoration:rounding 0
	hyprctl keyword decoration:shadow:enabled false
else
  waybar -c ~/.config/waybar/config.jsonc -s ~/.config/waybar/style_light.css &
  hyprctl keyword general:border_size 0
  hyprctl keyword general:gaps_in 5
	hyprctl keyword general:gaps_out 10, 15, 20, 15
	hyprctl keyword decoration:rounding 10
	hyprctl keyword decoration:shadow:enabled true
fi
