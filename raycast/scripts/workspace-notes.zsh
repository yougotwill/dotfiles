#!/bin/zsh

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Workspace: Notes
# @raycast.mode silent

# Optional parameters:
# @raycast.packageName System
# @raycast.icon 📒

# Documentation:
# @raycast.description Workspace for writing notes
# @raycast.author yougotwill
# @raycast.authorURL https://github.com/yougotwill

RAYCAST_WORKSPACE=$(defaults read com.raycast.macos workspace)

if [[ $RAYCAST_WORKSPACE == "Notes" ]]; then
  defaults delete com.raycast.macos workspace
  osascript -e 'tell application "ProNotes" to quit'
  osascript -e 'tell application "Notes" to quit'
  echo "Closed Workspace: Notes 📒"
else
  defaults write com.raycast.macos workspace "Notes"
  open -a "ProNotes.app"
  open -a "Notes.app"
  echo "Opened Workspace: Notes 📒"
fi