#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CLAUDE_TARGET="${SCRIPT_DIR}"
CLAUDE_LINK="${HOME}/.claude"

if [ -L "${CLAUDE_LINK}" ]; then
  current_target="$(readlink "${CLAUDE_LINK}")"
  if [ "${current_target}" = "${CLAUDE_TARGET}" ]; then
    echo "~/.claude already symlinked to ${CLAUDE_TARGET}, skipping."
  else
    echo "~/.claude is a symlink to '${current_target}', re-pointing to ${CLAUDE_TARGET}..."
    ln -sf "${CLAUDE_TARGET}" "${CLAUDE_LINK}"
    echo "Symlink updated."
  fi
else
  ln -sf "${CLAUDE_TARGET}" "${CLAUDE_LINK}"
  echo "~/.claude -> ${CLAUDE_TARGET}"
fi
