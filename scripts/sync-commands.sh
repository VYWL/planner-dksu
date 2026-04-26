#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(cd "${script_dir}/.." && pwd)"
source_dir="${repo_root}/commands"
target_dir="${HOME}/.claude/commands"

if [[ ! -d "${source_dir}" ]]; then
  printf 'Error: source commands directory not found: %s\n' "${source_dir}" >&2
  exit 1
fi

mkdir -p "${target_dir}"

copied_any=0
for command_file in plan-dksu.md; do
  source_file="${source_dir}/${command_file}"
  if [[ -f "${source_file}" ]]; then
    cp "${source_file}" "${target_dir}/"
    printf 'Copied %s -> %s\n' "${source_file}" "${target_dir}/"
    copied_any=1
  else
    printf 'Error: command source not found: %s\n' "${source_file}" >&2
    exit 1
  fi
done

if [[ "${copied_any}" -eq 0 ]]; then
  printf 'No command files found to copy.\n'
else
  printf 'Done. Restart or reload your Claude Code session for the command palette to refresh.\n'
fi
