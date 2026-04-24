#!/bin/bash

if pgrep -x wofi; then
  killall wofi
else
  ssid=$(nmcli -t -f ssid dev wifi | sort -u | awk 'NR>1' | wofi -i --dmenu -c "$HOME"/.config/wofi/wifilistconfig)

  # if cancel:
  if [ -z "$ssid" ]; then
    exit 0
  fi

  nmcli dev wifi connect "$ssid" &>/dev/null

  if [ $? -eq 0 ]; then
    notify-send -a Network "Connected to $ssid."
    exit 0
  fi

  # if connection failed:
  psswd=$(zenity --password --title="Enter Wi-Fi Password")

  # if cancel:
  if [ -z "$psswd" ]; then
    notify-send -a Network "Error: Empty password"
    exit 0
  fi

  # try to connect to the network with the password
  nmcli dev wifi connect "$ssid" password "$psswd" &>/dev/null

  # if success
  if [ $? -eq 0 ]; then
    notify-send -a Network "Connected to $ssid."
  else
    notify-send -a Network "Failed to connect to $ssid."
    exit 1
  fi
fi
