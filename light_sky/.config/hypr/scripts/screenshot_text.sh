#!/bin/bash

grim -g "$(slurp)" - | tesseract stdin stdout | wl-copy
