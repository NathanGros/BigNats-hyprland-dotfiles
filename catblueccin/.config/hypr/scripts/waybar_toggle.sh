#!/bin/bash
if pgrep -x waybar; then
    killall waybar
    sleep 0.5
fi
waybar -c ~/.config/waybar/config.jsonc -s ~/.config/waybar/style.css &
