#!/bin/zsh

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Workspace: Notes
# @raycast.mode silent

# Optional parameters:
# @raycast.packageName System
# @raycast.icon 📒

# Documentation:
# @raycast.description Workspace for writing notes and reminders
# @raycast.author yougotwill
# @raycast.authorURL https://github.com/yougotwill

defaults write com.raycast.macos workspace "Notes"

open -a "Logseq.app"

# specific to omniwm so we open our apps on the correct workspace
/opt/homebrew/bin/omniwmctl command switch-workspace 1

open -a "Reminders.app"
open -a "Notes.app"
open -a "ProNotes.app"

echo "Opened Workspace: Notes 📒"
