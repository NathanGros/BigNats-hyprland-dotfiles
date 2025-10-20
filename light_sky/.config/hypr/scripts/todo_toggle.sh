#!/bin/sh
if pgrep -x c3; then
    killall c3
else
    foot -T todo -e c3 &
fi
