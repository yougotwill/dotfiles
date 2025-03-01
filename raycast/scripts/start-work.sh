#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Start Work
# @raycast.mode silent

# Optional parameters:
# @raycast.packageName System
# @raycast.icon 🧑‍💻

# Documentation:
# @raycast.description Opens all the apps used for work
# @raycast.author yougotwill
# @raycast.authorURL https://github.com/yougotwill

open -a "Toggl Track.app"
open -a "Vesktop.app"
open -a "Logseq.app"
open -a "Figma.app"
open -a "Visual Studio Code.app"
sleep 10
open -a "Firefox Developer Edition.app"
