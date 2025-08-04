#!/bin/bash
# -*- coding: utf-8 -*-
aur_helper="yay"
count=$(checkupdates-with-aur | wc -l)
# count=$(pacman -Qu | wc -l)
char="•"

if (( count == 0 )); then
  printf "0\n"
elif (( count < 11 )); then
  for ((i=0; i<count-1; i++)); do
    printf "%s" "$char"
    printf " "
  done
  printf "%s" "$char"
  printf "\n"
elif (( count < 20 )); then
  for ((i=0; i<count; i++)); do
    printf "%s" "$char"
  done
  printf "\n"
else
  printf "• • • • •  %s\n" "$count"
fi
