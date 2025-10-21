#!/bin/bash
is_notification_on=0
while true; do
    bat_lvl=$(cat /sys/class/power_supply/BAT1/capacity)
    is_charging=$(cat /sys/class/power_supply/ACAD/online)
    if [ "$bat_lvl" -le 20 ]; then
        if [ "$is_charging" -eq 0 ] && [ $is_notification_on -eq 0 ]; then
            notify-send --urgency=CRITICAL -a "Battery low" "${bat_lvl}% remaining" "Click to dismiss"
            is_notification_on=1
        fi
        if [ "$is_charging" -eq 1 ] && [ $is_notification_on -eq 1 ]; then
            makoctl dismiss -a
            is_notification_on=0
        fi
    fi
    sleep 10
done
