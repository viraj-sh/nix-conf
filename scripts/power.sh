#!/usr/bin/env sh

choice=$(printf 'Toggle eDP\nLogout\nRestart\nShutdown' | dmenu -i -p 'Power:')
[ -z "$choice" ] && exit 0

case "$choice" in
  "Toggle eDP")
    if xrandr --listmonitors | grep -q eDP-1; then
      xrandr --output eDP-1 --off
    else
      xrandr --output eDP-1 --auto --right-of HDMI-1
    fi
    ;;
  Logout)   pkill -x dwm ;;
  Restart)  systemctl reboot ;;
  Shutdown) systemctl poweroff ;;
esac
