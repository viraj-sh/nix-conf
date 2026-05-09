#!/usr/bin/env bash

ntfy sub https://ntfy.viraj.top/honeygain | while read -r line; do
  msg=$(echo "$line" | jq -r '.message // empty')
  if [[ -n "$msg" ]]; then
    notify-send "Honeygain" "$msg"
    xdg-open "https://dashboard.honeygain.com/" >/dev/null 2>&1
  fi
done
