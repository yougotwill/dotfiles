#!/bin/zsh

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Stop Work
# @raycast.mode silent

# Optional parameters:
# @raycast.packageName System
# @raycast.icon 😴

# Documentation:
# @raycast.description Closes all the apps used for work
# @raycast.author yougotwill
# @raycast.authorURL https://github.com/yougotwill

osascript -e 'tell application "Figma" to quit'
osascript -e 'tell application "Logseq" to quit'
osascript -e 'tell application "Vesktop" to quit'
osascript -e 'tell application "Visual Studio Code" to quit'
