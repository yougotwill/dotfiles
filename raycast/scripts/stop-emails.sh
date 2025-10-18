#!/bin/zsh

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Stop Emails
# @raycast.mode silent

# Optional parameters:
# @raycast.packageName Scripts
# @raycast.icon 💌

# Documentation:
# @raycast.description Stop email applications
# @raycast.author yougotwill
# @raycast.authorURL https://github.com/yougotwill

osascript -e 'tell application "Thunderbird" to quit'
osascript -e 'tell application "Proton Mail Bridge" to quit'
