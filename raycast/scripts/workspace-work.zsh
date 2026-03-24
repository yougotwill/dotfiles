#!/bin/zsh

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Workspace: Work
# @raycast.mode silent

# Optional parameters:
# @raycast.packageName System
# @raycast.icon 🧑‍💻

# Documentation:
# @raycast.description Workspace for work
# @raycast.author yougotwill
# @raycast.authorURL https://github.com/yougotwill

RAYCAST_WORKSPACE=$(defaults read com.raycast.macos workspace)

defaults write com.raycast.macos workspace "Work"
open -a "Vesktop.app"
open -a "Logseq.app"
open -a "Visual Studio Code.app"
open "http://" # opens default browser

# restart window manager to assign windows to correctly
# /Users/will/bin/restart-window-manager.sh

echo "Opened Workspace: Work 🧑‍💻"
