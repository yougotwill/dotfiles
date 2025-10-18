#!/bin/zsh

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Stop Notes
# @raycast.mode silent

# Optional parameters:
# @raycast.packageName Scripts
# @raycast.icon 🗒️

# Documentation:
# @raycast.description Stop notes applications
# @raycast.author yougotwill
# @raycast.authorURL https://github.com/yougotwill

osascript -e 'tell application "ProNotes" to quit'
osascript -e 'tell application "Notes" to quit'
