#!/bin/zsh

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Workspace: Emails
# @raycast.mode silent

# Optional parameters:
# @raycast.packageName System
# @raycast.icon ✉️

# Documentation:
# @raycast.description Workspace for email tasks
# @raycast.author yougotwill
# @raycast.authorURL https://github.com/yougotwill

defaults write com.raycast.macos workspace "Emails"

open -a "Proton Mail Bridge"
sleep 15

# specific to omniwm so we open our apps on the correct workspace
/opt/homebrew/bin/omniwmctl command switch-workspace 1

open -a "Mail"
open -a "Thunderbird"

echo "Opened Workspace: Emails ✉️"
