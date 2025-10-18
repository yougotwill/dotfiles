#!/bin/zsh

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Check Current Workspace
# @raycast.mode silent

# Optional parameters:
# @raycast.packageName System
# @raycast.icon 🔎

# Documentation:
# @raycast.description Check what workspace is currently open
# @raycast.author yougotwill
# @raycast.authorURL https://github.com/yougotwill

RAYCAST_WORKSPACE=$(defaults read com.raycast.macos workspace)

if [[ $RAYCAST_WORKSPACE == "" ]]; then
  echo "No Workspace running 🔎"
else
  echo "Workspace is $RAYCAST_WORKSPACE 🔎"
fi