#!/bin/zsh

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Stop Admin
# @raycast.mode silent

# Optional parameters:
# @raycast.packageName System
# @raycast.icon 😴

# Documentation:
# @raycast.description Closes all the apps used for admin
# @raycast.author yougotwill
# @raycast.authorURL https://github.com/yougotwill

osascript -e 'tell application "Reminders" to quit'
osascript -e 'tell application "Notes" to quit'
osascript -e 'tell application "Calendar" to quit'
osascript -e 'tell application "Logseq" to quit'
osascript -e 'tell application "Google Drive" to quit'
osascript -e 'tell application "Mail" to quit'
osascript -e 'tell application "Thunderbird" to quit'
osascript -e 'tell application "Nimble Commander" to quit'