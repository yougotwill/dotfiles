#!/bin/zsh

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Start Replies
# @raycast.mode silent

# Optional parameters:
# @raycast.packageName System
# @raycast.icon 💬

# Documentation:
# @raycast.description Opens all the apps used for chat replies
# @raycast.author yougotwill
# @raycast.authorURL https://github.com/yougotwill

# Move to Desktop 6 first
osascript -e 'tell application "System Events" to key code 22 using control down'
sleep 2
open -a "Whatsapp"
open -a "Whatsapp SA"
open -a "Vesktop"
open -a "Signal"
open -a "Telegram"
