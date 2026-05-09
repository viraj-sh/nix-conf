#!/usr/bin/env bash

grim -g "$(slurp)" - | tesseract stdin stdout 2>/dev/null | wl-copy