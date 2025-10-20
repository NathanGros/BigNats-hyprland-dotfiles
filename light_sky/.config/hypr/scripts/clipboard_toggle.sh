#!/bin/bash
if pgrep -x wofi; then
  killall wofi
else
  cliphist list | wofi --dmenu -c $HOME/.config/wofi/clipboardconfig | cliphist decode | wl-copy &
fi
