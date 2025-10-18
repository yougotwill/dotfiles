#!/bin/zsh

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Start Admin
# @raycast.mode silent

# Optional parameters:
# @raycast.packageName System
# @raycast.icon 📫

# Documentation:
# @raycast.description Opens all the apps used for admin
# @raycast.author yougotwill
# @raycast.authorURL https://github.com/yougotwill

# Move to Desktop 7 first
# osascript -e 'tell application "System Events" to key code 26 using control down'
# sleep 2
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
open -a "Zen"
open -a "Proton Pass"
sleep 15
open -a "Mail"
open -a "Thunderbird"
