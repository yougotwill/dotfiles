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
sleep 5
open -a "Proton Drive"
open -a "Yubico Authenticator"
open -a "Proton Pass"
sleep 5
open -a "Nimble Commander"
open -a "Calendar"
open -a "Logseq"
open -a "Notes"
open -a "Reminders"
sleep 5
open -a "Thunderbird"
open -a "Mail"
# open "http://" # opens default browser

# restart window manager to assign windows to correctly
# /Users/will/bin/restart-window-manager.sh

echo "Opened Workspace: Admin ✅"
