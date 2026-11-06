#!/usr/bin/env bash
# Builds dist/ai-os-starter-plugin.zip from plugins/ai-os-starter, with
# .claude-plugin/plugin.json and skills/ at the zip root.
#
#   scripts/build-plugin-zip.sh           build the zip
#   scripts/build-plugin-zip.sh --check   fail if the committed zip differs from
#                                         the plugin folder in file list or content
set -euo pipefail

root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
plugin="$root/plugins/ai-os-starter"
zipfile="$root/dist/ai-os-starter-plugin.zip"

check() {
  [ -f "$zipfile" ] || { echo "FAIL: no zip at $zipfile. Run scripts/build-plugin-zip.sh" >&2; return 1; }
  tmp="$(mktemp -d)"
  trap 'rm -rf "$tmp"' RETURN
  unzip -q "$zipfile" -d "$tmp/unpacked"
  if ! diff -r -x .DS_Store "$plugin" "$tmp/unpacked"; then
    echo "FAIL: $zipfile is stale. Run scripts/build-plugin-zip.sh and commit the result." >&2
    return 1
  fi
  # .DS_Store is ignored above because Finder can drop one in a local folder, where
  # git ignores it and the build skips it. It must never be in the zip itself.
  if unzip -Z1 "$zipfile" | grep -E '(^|/)\.DS_Store$' >&2; then
    echo "FAIL: $zipfile contains .DS_Store. Run scripts/build-plugin-zip.sh and commit the result." >&2
    return 1
  fi
  [ -f "$tmp/unpacked/.claude-plugin/plugin.json" ] && [ -d "$tmp/unpacked/skills" ] || {
    echo "FAIL: .claude-plugin/plugin.json and skills/ must be at the zip root." >&2
    return 1
  }
  echo "PASS: $zipfile matches plugins/ai-os-starter ($(unzip -Z1 "$zipfile" | grep -vc '/$') files)."
}

build() {
  mkdir -p "$(dirname "$zipfile")"
  rm -f "$zipfile"
  (cd "$plugin" && find . -mindepth 1 ! -name .DS_Store | sed 's|^\./||' | LC_ALL=C sort | zip -q -X "$zipfile" -@)
  echo "Built $zipfile ($(unzip -Z1 "$zipfile" | grep -vc '/$') files)."
}

case "${1:-}" in
  "") build ;;
  --check) check ;;
  *) echo "Usage: scripts/build-plugin-zip.sh [--check]" >&2; exit 2 ;;
esac
