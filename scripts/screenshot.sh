#!/usr/bin/env bash
set -euo pipefail

SAVE_DIR="/mnt/data/Nextcloud/pictures/screenshots"
TMP_FILE="$(mktemp /tmp/screenshot-XXXXXX.png)"
FINAL_NAME="$(date +%Y%m%d-%H%M%S).png"
FINAL_PATH="$SAVE_DIR/$FINAL_NAME"

if [ ! -d "$SAVE_DIR" ]; then
    notify-send "Screenshot error" "Save directory does not exist: $SAVE_DIR"
    exit 1
fi

# Key point: -l turns on highlight fill, -c sets semi-transparent gray-blue, -t 0 disables window selection
if ! maim -s -m 10 -l -c 0.3,0.4,0.6,0.4 "$TMP_FILE"; then
    rm -f "$TMP_FILE"
    exit 1
fi

if [ ! -s "$TMP_FILE" ]; then
    rm -f "$TMP_FILE"
    exit 1
fi

xclip -selection clipboard -t image/png -i "$TMP_FILE"
mv "$TMP_FILE" "$FINAL_PATH"

# Comment out this line in production
# notify-send "Screenshot saved" "$FINAL_PATH"
