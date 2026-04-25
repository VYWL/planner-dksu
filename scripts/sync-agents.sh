#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(cd "${script_dir}/.." && pwd)"
source_dir="${repo_root}/agents"
target_dir="${HOME}/.config/opencode/agents"

if [[ ! -d "${source_dir}" ]]; then
  printf 'Error: source agents directory not found: %s\n' "${source_dir}" >&2
  exit 1
fi

mkdir -p "${target_dir}"

copied_any=0
for agent_file in dksu.md researcher-dksu.md designer-dksu.md critical-dksu.md; do
  source_file="${source_dir}/${agent_file}"
  if [[ -f "${source_file}" ]]; then
    cp "${source_file}" "${target_dir}/"
    printf 'Copied %s -> %s\n' "${source_file}" "${target_dir}/"
    copied_any=1
  fi
done

if [[ "${copied_any}" -eq 0 ]]; then
  printf 'No agent files found to copy.\n'
fi
