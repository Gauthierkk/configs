#!/bin/bash
# Pull latest Raycast config from the dotfiles repo and import into Raycast
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(git -C "$SCRIPT_DIR" rev-parse --show-toplevel)"

echo "Pulling latest config..."
git -C "$REPO_ROOT" pull

# Find the .rayconfig file
RAYCONFIG="$SCRIPT_DIR/raycast-config.rayconfig"

echo "Importing: $RAYCONFIG"
open -g "raycast://import?path=$(python3 -c "import urllib.parse, sys; print(urllib.parse.quote(sys.argv[1]))" "$RAYCONFIG")"
