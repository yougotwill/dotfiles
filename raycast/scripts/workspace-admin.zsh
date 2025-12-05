#!/bin/zsh

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Workspace: Admin
# @raycast.mode silent

# Optional parameters:
# @raycast.packageName System
# @raycast.icon ✅

# Documentation:
# @raycast.description Workspace for admin tasks
# @raycast.author yougotwill
# @raycast.authorURL https://github.com/yougotwill

RAYCAST_WORKSPACE=$(defaults read com.raycast.macos workspace)

if [[ $RAYCAST_WORKSPACE == "Admin" ]]; then
  defaults delete com.raycast.macos workspace
  osascript -e 'tell application "Thunderbird" to quit'
  osascript -e 'tell application "Mail" to quit'
  osascript -e 'tell application "Notes" to quit'
  osascript -e 'tell application "Reminders" to quit'
  osascript -e 'tell application "Calendar" to quit'
  osascript -e 'tell application "Logseq" to quit'
  osascript -e 'tell application "Nimble Commander" to quit'
  osascript -e 'tell application "Yubico Authenticator" to quit'
  osascript -e 'tell application "Proton Pass" to quit'
  osascript -e 'tell application "Proton Mail Bridge" to quit'
  osascript -e 'tell application "Google Drive" to quit'
  echo "Closed Workspace: Admin"
else
  defaults write com.raycast.macos workspace "Admin"
  open -a "Proton Mail Bridge"
  open -a "Proton Drive"
  open -a "Google Drive"
  open -a "Yubico Authenticator"
  open -a "Nimble Commander"
  sleep 5
  open -a "Calendar"
  open -a "Logseq"
  open -a "Notes"
  sleep 1
  open -a "Reminders"
  open -a "Proton Pass"
  sleep 15
  open "http://" # opens default browser
  open -a "Mail"
  open -a "Thunderbird"
  echo "Opened Workspace: Admin ✅"
fi