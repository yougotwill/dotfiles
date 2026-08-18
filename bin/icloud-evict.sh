#!/bin/zsh
# Evicts a file or folder to the cloud storage using icloud-tools

icloud-evict() {
  local target="$1"

  if [[ -z "$target" ]]; then
    print -u2 "Usage: icloud-evict <file-or-folder>"
    return 1
  fi

  if [[ ! -e "$target" ]]; then
    print -u2 "Error: path does not exist: $target"
    return 1
  fi

  if [[ -d "$target" ]]; then
    icloud evict -r "$target"
  else
    icloud evict "$target"
  fi

  osascript -e 'display notification "Download removed" with title "Cloud Storage"'
}

icloud-evict $1