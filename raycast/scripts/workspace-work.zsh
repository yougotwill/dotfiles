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

defaults write com.raycast.macos workspace "Work"

open -a "Logseq.app"

# specific to omniwm so we open our apps on the correct workspace
/opt/homebrew/bin/omniwmctl command switch-workspace 1

open -a "Vesktop.app"
open -a "Visual Studio Code.app"
open "http://" # opens default browser

echo "Opened Workspace: Work 🧑‍💻"
