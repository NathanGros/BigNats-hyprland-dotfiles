#!/bin/bash
if pgrep -x wf-recorder; then
    killall wf-recorder
else
    path="$HOME/Videos/wf-recorder/"
    prefix="screencast_"
    filedate=$(date +"%G-%m-%d_%H-%M-%S")
    suffix=".mp4"
    filename=$path$prefix$filedate$suffix
    filenameshort=$prefix$filedate$suffix
    GEOM=$(hyprctl monitors -j | jq -r '.[] | "\(.x),\(.y) \(.width)x\(.height)"')
    wf-recorder -a -f "$filename" -g "$GEOM"
    notify-send -a Recording "Recording saved at $filenameshort"
fi
