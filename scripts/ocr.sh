#!/usr/bin/env bash
set -euo pipefail

TMP_FILE="$(mktemp /tmp/ocr-XXXXXX.png)"

# Capture region (same highlight overlay as screenshot.sh)
if ! maim -s -m 10 -l -c 0.3,0.4,0.6,0.4 "$TMP_FILE"; then
    rm -f "$TMP_FILE"
    exit 1
fi

if [ ! -s "$TMP_FILE" ]; then
    rm -f "$TMP_FILE"
    notify-send "OCR error" "Empty or cancelled capture"
    exit 1
fi

# Extract text
TEXT="$(tesseract "$TMP_FILE" stdout 2>/dev/null || true)"
rm -f "$TMP_FILE"

if [ -z "${TEXT//[[:space:]]/}" ]; then
    notify-send "OCR" "No text detected in selection"
    exit 1
fi

# Copy to clipboard
printf '%s' "$TEXT" | xclip -selection clipboard

notify-send "OCR copied to clipboard" "${TEXT:0:120}"
