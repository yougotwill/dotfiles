#!/bin/zsh

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Workspace: Work
# @raycast.mode silent

# Optional parameters:
# @raycast.packageName System
# @raycast.icon 🧑‍💻

# Documentation:
# @raycast.description Workspace for work
# @raycast.author yougotwill
# @raycast.authorURL https://github.com/yougotwill

RAYCAST_WORKSPACE=$(defaults read com.raycast.macos workspace)

if [[ $RAYCAST_WORKSPACE == "Work" ]]; then
  defaults delete com.raycast.macos workspace
  osascript -e 'tell application "Logseq" to quit'
  osascript -e 'tell application "Vesktop" to quit'
  osascript -e 'tell application "Visual Studio Code" to quit'
  echo "Closed Workspace: Work 🧑‍💻"
else
  defaults write com.raycast.macos workspace "Work"
  open -a "Vesktop.app"
  open -a "Logseq.app"
  open -a "Visual Studio Code.app"
  open -a "Zen.app"
  echo "Opened Workspace: Work 🧑‍💻"
fi