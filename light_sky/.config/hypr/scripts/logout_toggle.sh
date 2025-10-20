#!/bin/sh
if pgrep -x wlogout; then
  pkill wlogout
else
  wlogout -b 4 -L 300 -R 300 -T 300 -B 300 -s
fi
