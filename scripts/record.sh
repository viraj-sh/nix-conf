#!/usr/bin/env bash

set -e

SAVE_PATH=$(zenity --file-selection --save --title="Save Screen Recording As")
[ -z "$SAVE_PATH" ] && {
  notify-send "❌ Recording Cancelled" "No file selected."
  exit 1
}

[[ "$SAVE_PATH" != *.mp4 ]] && SAVE_PATH="${SAVE_PATH}.mp4"

X=$(hyprctl monitors -j | jq -r '.[0].x')
Y=$(hyprctl monitors -j | jq -r '.[0].y')
RES="1920x1080"

# ✅ Your actual Bluetooth audio monitor
AUDIO_SOURCE="bluez_output.B0_A3_F2_4D_9B_B0.1.monitor"

notify-send "🎥 Screen Recording" "Recording started."
echo "Recording started. Type 'stop' to stop."

wf-recorder \
  -g "${X}x${Y}+$RES" \
  --audio="$AUDIO_SOURCE" \
  --framerate 60 \
  -f "$SAVE_PATH" &
REC_PID=$!

while true; do
  read -rp "> " input
  if [[ "$input" == "stop" ]]; then
    kill "$REC_PID"
    break
  fi
done

notify-send "✅ Recording Saved" "Saved to: $SAVE_PATH"
echo "Recording stopped. Saved to: $SAVE_PATH"
