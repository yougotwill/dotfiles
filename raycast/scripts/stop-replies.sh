#!/bin/zsh

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Stop Replies
# @raycast.mode silent

# Optional parameters:
# @raycast.packageName System
# @raycast.icon 😴

# Documentation:
# @raycast.description Closes all the apps used for chat replies
# @raycast.author yougotwill
# @raycast.authorURL https://github.com/yougotwill

osascript -e 'tell application "Whatsapp" to quit'
osascript -e 'tell application "Whatsapp SA" to quit'
osascript -e 'tell application "Vesktop" to quit'
osascript -e 'tell application "Signal" to quit'
osascript -e 'tell application "Telegram" to quit'
