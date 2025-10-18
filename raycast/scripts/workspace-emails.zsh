#!/bin/zsh

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Workspace: Emails
# @raycast.mode silent

# Optional parameters:
# @raycast.packageName System
# @raycast.icon ✉️

# Documentation:
# @raycast.description Workspace for email tasks
# @raycast.author yougotwill
# @raycast.authorURL https://github.com/yougotwill

RAYCAST_WORKSPACE=$(defaults read com.raycast.macos workspace)

if [[ $RAYCAST_WORKSPACE == "Emails" ]]; then
  defaults delete com.raycast.macos workspace
  osascript -e 'tell application "Mail" to quit'
  osascript -e 'tell application "Thunderbird" to quit'
  osascript -e 'tell application "Proton Mail Bridge" to quit'
  echo "Closed Workspace: Emails ✉️"
else
  defaults write com.raycast.macos workspace "Emails"
  open -a "Proton Mail Bridge"
  open -a "Mail"
  sleep 15
  open -a "Thunderbird"
  echo "Opened Workspace: Emails ✉️"
fi