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

defaults write com.raycast.macos workspace "Admin"

open -a "Proton Mail Bridge"
open -a "Proton Pass"
open -a "Yubico Authenticator"
open -a "Proton Drive"

# specific to omniwm so we open our apps on the correct workspace
/opt/homebrew/bin/omniwmctl command switch-workspace 1

open -a "Nimble Commander"
open -a "Reminders"
open -a "Notes"
open -a "Calendar"
open -a "Logseq"

sleep 15

open -a "Mail"
open -a "Thunderbird"
# open "http://" # opens default browser

echo "Opened Workspace: Admin ✅"
