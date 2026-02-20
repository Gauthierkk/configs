#!/bin/bash
set -euo pipefail

CONFIG_CLAUDE="${HOME}/.config/.claude"
LOCAL_CLAUDE="${HOME}/.claude"

# Tracked directories to merge bidirectionally
TRACKED_DIRS=("skills" "hooks" "plugins/marketplaces")
# Tracked flat files (take newer wins)
TRACKED_FILES=(
  "CLAUDE.md"
  "RTK.md"
  "settings.json"
  "plugins/installed_plugins.json"
  "plugins/known_marketplaces.json"
  "plugins/blocklist.json"
)

# ── helpers ──────────────────────────────────────────────────────────────────

merge_dirs() {
  local dir="$1"
  local src="${LOCAL_CLAUDE}/${dir}"
  local dst="${CONFIG_CLAUDE}/${dir}"
  local copied=0

  # local → config  (new items written locally)
  if [ -d "${src}" ]; then
    for item in "${src}"/*/; do
      [ -d "${item}" ] || continue
      name="$(basename "${item}")"
      if [ ! -d "${dst}/${name}" ]; then
        cp -r "${item}" "${dst}/${name}"
        echo "  [local → config] ${dir}/${name}"
        copied=1
      fi
    done
  fi

  # config → local  (new items pulled from remote)
  if [ -d "${dst}" ]; then
    for item in "${dst}"/*/; do
      [ -d "${item}" ] || continue
      name="$(basename "${item}")"
      if [ ! -d "${src}/${name}" ]; then
        mkdir -p "${src}"
        cp -r "${item}" "${src}/${name}"
        echo "  [config → local] ${dir}/${name}"
        copied=1
      fi
    done
  fi

  return $((1 - copied))  # 0 = something copied, 1 = nothing
}

merge_file() {
  local file="$1"
  local src="${LOCAL_CLAUDE}/${file}"
  local dst="${CONFIG_CLAUDE}/${file}"

  [ -f "${src}" ] || [ -f "${dst}" ] || return 0

  if [ ! -f "${dst}" ]; then
    mkdir -p "$(dirname "${dst}")"
    cp "${src}" "${dst}"
    echo "  [local → config] ${file}"
    any_change=1
  elif [ ! -f "${src}" ]; then
    mkdir -p "$(dirname "${src}")"
    cp "${dst}" "${src}"
    echo "  [config → local] ${file}"
    any_change=1
  elif [ "${src}" -nt "${dst}" ]; then
    cp "${src}" "${dst}"
    echo "  [local → config] ${file} (newer)"
    any_change=1
  elif [ "${dst}" -nt "${src}" ]; then
    cp "${dst}" "${src}"
    echo "  [config → local] ${file} (newer)"
    any_change=1
  fi
}

# ── main ─────────────────────────────────────────────────────────────────────

# If ~/.claude is already symlinked to ~/.config/.claude, they're the same —
# just report what's untracked in git.
real_local="$(cd "${LOCAL_CLAUDE}" 2>/dev/null && pwd -P || echo "")"
real_config="$(cd "${CONFIG_CLAUDE}" 2>/dev/null && pwd -P || echo "")"

if [ "${real_local}" = "${real_config}" ] && [ -n "${real_local}" ]; then
  echo "~/.claude is symlinked to ~/.config/.claude — checking git status..."
  echo ""
  git -C "${CONFIG_CLAUDE}" status --short -- "${TRACKED_DIRS[@]}" "${TRACKED_FILES[@]}" 2>/dev/null || true
  untracked=$(git -C "${CONFIG_CLAUDE}" ls-files --others --exclude-standard "${TRACKED_DIRS[@]}" 2>/dev/null || true)
  [ -n "${untracked}" ] && echo "${untracked}" | sed 's/^/?? /'
  echo ""
  echo "Use 'git -C ~/.config/.claude add ...' to stage, then commit."
  exit 0
fi

echo "Merging ~/.claude <-> ~/.config/.claude ..."
echo ""

any_change=0

for dir in "${TRACKED_DIRS[@]}"; do
  merge_dirs "${dir}" && any_change=1 || true
done

for file in "${TRACKED_FILES[@]}"; do
  merge_file "${file}"
done

echo ""
if [ "${any_change}" -eq 1 ]; then
  echo "Done. Commit changes in ~/.config/.claude to push to remote."
else
  echo "Already in sync — nothing to do."
fi
