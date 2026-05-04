#!/usr/bin/env bash

# Subscribe to your water reminder topic and send desktop notifications
ntfy sub https://ntfy.viraj.top/health | while read -r line; do
  msg=$(echo "$line" | jq -r '.message // empty')
  if [[ -n "$msg" ]]; then
    notify-send "Water Reminder 💧" "$msg"
  fi
done
