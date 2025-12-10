#!/usr/bin/env bash

set -euo pipefail

TYPE="$1" # "home" or "system"
MODE="${2:-add}" # default to "add"

if [[ "$TYPE" != "home" && "$TYPE" != "system" ]]; then
  echo "❌ Usage: $0 [home|system] [add|remove]"
  exit 1
fi

# File paths
SYSTEM_FILE="/home/virajs/nixos-config/nixos/modules/syspkgs.nix"
HOME_FILE="/home/virajs/nixos-config/home/modules/programs.nix"
CONFIG_DIR="/home/virajs/nixos-config"
FLAKE_COMMAND="sudo nixos-rebuild switch --flake .#virajs"

if [[ "$TYPE" == "system" ]]; then
  FILE="$SYSTEM_FILE"
  MARKER="environment.systemPackages = with pkgs; \["
else
  FILE="$HOME_FILE"
  MARKER="home.packages = with pkgs; \["
fi

cd "$CONFIG_DIR"

if [[ "$MODE" == "remove" ]]; then
  echo "🗑️  Select packages to remove from $TYPE:"
  grep -A1000 "$MARKER" "$FILE" | sed -n '/\[/,/\]/p' | grep -v '\[' | grep -v '\]' \
    | sed 's/^[[:space:]]*//' | fzf --multi --preview 'echo {}' > /tmp/remove_pkgs.txt

  if [[ ! -s /tmp/remove_pkgs.txt ]]; then
    echo "❌ No packages selected for removal."
    exit 1
  fi

  while read -r PKG; do
    echo "🗑️  Removing $PKG"
    sed -i "\|^\s*$PKG\s*$|d" "$FILE"
  done < /tmp/remove_pkgs.txt
  rm /tmp/remove_pkgs.txt

else
  echo "🔍 Enter package name to search:"
  read -rp "> " query

  # Extract existing packages
  EXISTING=$(grep -A1000 "$MARKER" "$FILE" | sed -n '/\[/,/\]/p' | grep -v '\[' | grep -v '\]' | sed 's/^[[:space:]]*//')

  # Search + mark already-installed
  SELECTED_PKGS=$(nix search nixpkgs "$query" --json | jq -r 'to_entries[] | "\(.value.pname)\t\(.value.description)"' \
    | awk -F'\t' -v installed="$EXISTING" '
      BEGIN {
        split(installed, arr)
        for (i in arr) seen[arr[i]] = 1
      }
      {
        if (seen[$1]) printf "✅ %s\t%s\n", $1, $2
        else printf "   %s\t%s\n", $1, $2
      }' \
    | fzf --multi --with-nth=1,2 --delimiter='\t' --preview 'echo {}' \
    | sed 's/^✅ //;s/^ *//' | cut -f1)

  if [[ -z "$SELECTED_PKGS" ]]; then
    echo "❌ No packages selected."
    exit 1
  fi

  echo "📦 Selected:"
  echo "$SELECTED_PKGS"

  while read -r PKG; do
    if grep -qE "\s+$PKG\b" "$FILE"; then
      echo "✅ $PKG already exists"
    else
      echo "➕ Adding $PKG"
      sed -i "/$MARKER/a\    $PKG" "$FILE"
    fi
  done <<< "$SELECTED_PKGS"
fi

# Run rebuild
echo "🚀 Rebuilding system..."
eval "$FLAKE_COMMAND"
