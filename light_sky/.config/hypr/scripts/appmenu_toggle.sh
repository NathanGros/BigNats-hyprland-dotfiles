#!/bin/sh
if pgrep -x wofi; then
    killall wofi
else
    wofi --show drun &
fi
