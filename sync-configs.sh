#!/usr/bin/env bash
#
# sync-configs.sh — pull config files FROM this machine INTO the repo.
#
# Copies live dotfiles/configs from $HOME into ./configs so you can review
# the diff and commit manually. Does NOT commit or push.
#
# Usage:
#   scripts/sync-configs.sh          # apply changes
#   scripts/sync-configs.sh --dry    # show what would change, copy nothing

set -euo pipefail

DRY=0
[ "${1:-}" = "--dry" ] && DRY=1

# repo root = parent of this script's dir
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CONFIGS="$REPO_ROOT/configs"

# source-on-machine  ->  dest-in-repo
# VIA json files are manual exports from the VIA app — no live source, skipped.
MAP=(
  "$HOME/.gitconfig|$CONFIGS/.gitconfig"
  "$HOME/.gitignore_global|$CONFIGS/.gitignore_global"
  "$HOME/.zshrc|$CONFIGS/.zshrc"
  "$HOME/.claude/settings.json|$CONFIGS/claude/settings.json"
  "$HOME/.claude/statusline-command.sh|$CONFIGS/claude/statusline-command.sh"
  "$HOME/Library/Application Support/lazygit/config.yml|$CONFIGS/lazygit/config.yml"
)

changed=0
missing=0
same=0

for entry in "${MAP[@]}"; do
  src="${entry%%|*}"
  dst="${entry##*|}"
  rel="${dst#"$REPO_ROOT"/}"

  if [ ! -f "$src" ]; then
    printf 'MISS  %s  (source not found: %s)\n' "$rel" "$src"
    missing=$((missing + 1))
    continue
  fi

  if diff -q "$src" "$dst" >/dev/null 2>&1; then
    printf 'same  %s\n' "$rel"
    same=$((same + 1))
    continue
  fi

  if [ "$DRY" = "1" ]; then
    printf 'DIFF  %s  (would update)\n' "$rel"
  else
    mkdir -p "$(dirname "$dst")"
    cp "$src" "$dst"
    printf 'UPDT  %s\n' "$rel"
  fi
  changed=$((changed + 1))
done

echo "---"
if [ "$DRY" = "1" ]; then
  printf 'dry run: %d would change, %d same, %d missing\n' "$changed" "$same" "$missing"
else
  printf 'done: %d changed, %d same, %d missing\n' "$changed" "$same" "$missing"
  echo 'review with: git -C "'"$REPO_ROOT"'" diff -- configs/'
fi
