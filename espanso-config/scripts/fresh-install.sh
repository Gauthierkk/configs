#!/usr/bin/env bash
set -euo pipefail

# --- CONFIGURABLE PATHS ------------------------------------------------------

# Where espanso currently keeps its config (default macOS path)
ESPANSO_CONFIG_DIR="${HOME}/Library/Application Support/espanso"

# Where your Git repo lives, replace with local path if needed!
GIT_ESPANSO_DIR="${HOME}/Documents/code/espanso-config"

# -----------------------------------------------------------------------------


echo "Stopping espanso..."
espanso stop || true

echo "Ensuring Git config directory exists: ${GIT_ESPANSO_DIR}"
mkdir -p "${GIT_ESPANSO_DIR}"

# If there's an existing espanso config dir, move its contents into the Git repo once
if [ -d "${ESPANSO_CONFIG_DIR}" ] && [ ! -L "${ESPANSO_CONFIG_DIR}" ]; then
  echo "Found existing espanso config directory, migrating contents..."
  # Create target subdirs to avoid mv warnings
  mkdir -p "${GIT_ESPANSO_DIR}"
  mv "${ESPANSO_CONFIG_DIR}/"* "${GIT_ESPANSO_DIR}/" 2>/dev/null || true
  rmdir "${ESPANSO_CONFIG_DIR}" 2>/dev/null || true
fi

# Make sure parent exists (~/Library/Application Support)
PARENT_DIR="$(dirname "${ESPANSO_CONFIG_DIR}")"
mkdir -p "${PARENT_DIR}"

# If something still exists at ESPANSO_CONFIG_DIR (dir or wrong symlink), remove it
if [ -e "${ESPANSO_CONFIG_DIR}" ] || [ -L "${ESPANSO_CONFIG_DIR}" ]; then
  echo "Removing existing path at ${ESPANSO_CONFIG_DIR} (directory or symlink)..."
  rm -rf "${ESPANSO_CONFIG_DIR}"
fi

echo "Creating symlink:"
echo "  ${ESPANSO_CONFIG_DIR} -> ${GIT_ESPANSO_DIR}"
ln -s "${GIT_ESPANSO_DIR}" "${ESPANSO_CONFIG_DIR}"

echo "Starting espanso..."
espanso restart || espanso start

echo "Done."
echo "Active config path: ${ESPANSO_CONFIG_DIR} -> ${GIT_ESPANSO_DIR}"
