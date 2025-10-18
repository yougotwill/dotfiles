#!/bin/zsh

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Workspace: Replies
# @raycast.mode silent

# Optional parameters:
# @raycast.packageName System
# @raycast.icon 💬

# Documentation:
# @raycast.description Workspace for chat replies
# @raycast.author yougotwill
# @raycast.authorURL https://github.com/yougotwill

RAYCAST_WORKSPACE=$(defaults read com.raycast.macos workspace)

if [[ $RAYCAST_WORKSPACE == "Replies" ]]; then
  defaults delete com.raycast.macos workspace
  osascript -e 'tell application "Whatsapp" to quit'
  osascript -e 'tell application "Whatsapp SA" to quit'
  osascript -e 'tell application "Vesktop" to quit'
  osascript -e 'tell application "Signal" to quit'
  osascript -e 'tell application "Telegram" to quit'
  echo "Closed Workspace: Replies 💬"
else
  defaults write com.raycast.macos workspace "Replies"
  # Move to Desktop 6 first
  osascript -e 'tell application "System Events" to key code 22 using control down'
  sleep 2
  open -a "Whatsapp"
  open -a "Whatsapp SA"
  open -a "Vesktop"
  open -a "Signal"
  open -a "Telegram"
  echo "Opened Workspace: Replies 💬"
fi