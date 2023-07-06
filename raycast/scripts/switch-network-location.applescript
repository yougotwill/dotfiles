#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Switch Network Location
# @raycast.mode silent
# @raycast.argument1 { "type": "text", "placeholder": "Location (Home)", "optional": true }

# Optional parameters:
# @raycast.icon 📍
# @raycast.packageName System

# Documentation:
# @raycast.author William Grant
# @raycast.authorURL https://github.com/yougotwill
# @raycast.description Switch between different network locations.


# raycastArgv is Raycast argument
on run {raycastArgv}

# Locations
set location to raycastArgv
set automatic to "Automatic"
set home to "Home"

if (raycastArgv is equal to "") then
  set location to automatic
else if (raycastArgv is equal to "Automatic") then
  set location to automatic
else if (raycastArgv is equal to "Home") then
  set location to home
else
  set location to automatic
end if

try 
  set commandResult to do shell script "scselect" & space & "\"" & location & "\""

  if (commandResult contains "CurrentSet updated to") then
    log "Changed location to" & space & location
  else
    log commandResult
  end if
on error
  set commandResult to errStr
  log commandResult
end try

end run