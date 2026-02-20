#!/bin/bash
# Export Raycast config and save to dotfiles repo
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
RAYCONFIG="$SCRIPT_DIR/raycast-config.rayconfig"

# Remove old export so we can detect when the new one appears
rm -f "$RAYCONFIG"

echo "Triggering Raycast export..."
ENCODED_PATH=$(python3 -c "import urllib.parse, sys; print(urllib.parse.quote(sys.argv[1]))" "$RAYCONFIG")
open -g "raycast://export?path=$ENCODED_PATH"

# Wait up to 30 seconds for the export file to appear
echo "Waiting for export to complete..."
for i in $(seq 1 30); do
    if [ -f "$RAYCONFIG" ]; then
        echo "Export complete: $RAYCONFIG"
        exit 0
    fi
    sleep 1
done

echo "Error: Export timed out. Make sure Raycast is running." >&2
exit 1
