#!/bin/zsh
# Downloads a file or folder from the cloud storage using icloud-tools

icloud-download() {
  local target="$1"

  if [[ -z "$target" ]]; then
    print -u2 "Usage: icloud-download <file-or-folder>"
    return 1
  fi

  if [[ ! -e "$target" ]]; then
    print -u2 "Error: path does not exist: $target"
    return 1
  fi

  osascript -e 'display notification "Download started" with title "Cloud Storage"'

  if [[ -d "$target" ]]; then
    icloud download -r "$target"
  else
    icloud download "$target"
  fi

  osascript -e 'display notification "Download complete" with title "Cloud Storage"'
}

icloud-download $1