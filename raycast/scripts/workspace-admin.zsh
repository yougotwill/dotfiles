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

defaults write com.raycast.macos workspace "Admin"
open -a "Proton Mail Bridge"
open -a "Proton Drive"
open -a "Yubico Authenticator"
open -a "Proton Pass"
open -a "Nimble Commander"
sleep 5
open -a "Calendar"
open -a "Logseq"
open -a "Notes"
open -a "Reminders"
sleep 15
open -a "Thunderbird"
open "http://" # opens default browser
open -a "Mail"
echo "Opened Workspace: Admin ✅"
