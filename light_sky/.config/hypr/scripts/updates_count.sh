#!/bin/bash

# Get update updates_count
if ! updates_arch="$(checkupdates | wc -l)"; then
# if ! updates_arch="$(pacman -Sy; pacman -Qu | wc -l)"; then
    updates_arch=0
fi
if ! updates_aur="$(yay -Qum 2>/dev/null | wc -l)"; then
    updates_aur=0
fi
updates_count="$((updates_arch + updates_aur))"

# Format output string
char="•"
if (( updates_count == 0 )); then
    printf "0\n"
elif (( updates_count < 11 )); then
    for ((i=0; i<updates_count-1; i++)); do
        printf "%s" "$char"
        printf " "
    done
    printf "%s" "$char"
    printf "\n"
elif (( updates_count < 20 )); then
    for ((i=0; i<updates_count; i++)); do
        printf "%s" "$char"
    done
    printf "\n"
else
    printf "• • • • •  %s\n" "$updates_count"
fi
