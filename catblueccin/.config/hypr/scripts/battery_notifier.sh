#!/bin/bash

################
# DEPENDENCIES #
################

# mako
# notify-send


#############
# VARIABLES #
#############

threshold_low=20
threshold_critical=10
wait_time=30


##########
# Script #
##########

warnlevel=0
prev_warnlevel=0
is_notification_on=0
notification_id=0
while true; do
    is_charging=$(cat /sys/class/power_supply/ACAD/online)

	# Reset / do nothing if charging
	if [ "$is_charging" -eq 1 ]; then
		if [ $is_notification_on -eq 1 ]; then
			makoctl dismiss -n "$notification_id"
			is_notification_on=0
		fi
		warnlevel=0
		prev_warnlevel=0
		sleep "$wait_time"
		continue
	fi

	# Get warning level
    bat_lvl=$(cat /sys/class/power_supply/BAT1/capacity)
    if [ "$bat_lvl" -le $threshold_critical ]; then
		warnlevel=2
	elif [ "$bat_lvl" -le $threshold_low ]; then
		warnlevel=1
	else
		warnlevel=0
	fi

	# Send notification if threshold crossed
	if [ $warnlevel -eq 1 ] && [ $prev_warnlevel -lt $warnlevel ]; then
		notification_id=$(notify-send --urgency=CRITICAL -a "Warning" "Battery low" --print-id)
		is_notification_on=1
	elif [ $warnlevel -eq 2 ] && [ $prev_warnlevel -lt $warnlevel ]; then
		if [ $is_notification_on -eq 1 ]; then
			makoctl dismiss -n "$notification_id"
		fi
		notification_id=$(notify-send --urgency=CRITICAL -a "Warning" "Battery VERY low" --print-id)
		is_notification_on=1
	fi

	prev_warnlevel=$warnlevel
    sleep "$wait_time"
done
