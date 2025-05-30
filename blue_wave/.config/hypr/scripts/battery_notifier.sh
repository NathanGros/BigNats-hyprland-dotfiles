#!/bin/bash
while true; do
  bat_lvl=$(cat /sys/class/power_supply/BAT1/capacity)
  if [ "$bat_lvl" -le 20 ]; then
    notify-send --urgency=CRITICAL "Battery Low" "Level: ${bat_lvl}%\nClick to dismiss"
    sleep 300
  else
    sleep 60
  fi
done
