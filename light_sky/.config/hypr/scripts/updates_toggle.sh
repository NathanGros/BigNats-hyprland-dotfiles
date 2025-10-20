#!/bin/sh
if pgrep -x updates_install; then
    exit
else
  foot -T updates -e ~/.config/hypr/scripts/updates_install.sh &
  hyprctl dispatch workspace special:minimized
  sleep 1
  hyprctl dispatch focuswindow title:updates
fi
