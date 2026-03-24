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

RAYCAST_WORKSPACE=$(defaults read com.raycast.macos workspace)

defaults write com.raycast.macos workspace "Notes"
open -a "Logseq.app"
open -a "ProNotes.app"
open -a "Notes.app"
open -a "Reminders.app"

# restart window manager to assign windows to correctly
# /Users/will/bin/restart-window-manager.sh

echo "Opened Workspace: Notes 📒"
