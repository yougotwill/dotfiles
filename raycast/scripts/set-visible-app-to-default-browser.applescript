#!/usr/bin/osascript

# Dependency: requires defaultbrowser (https://github.com/kerma/defaultbrowser/)
# Install via Homebrew: `brew install defaultbrowser`

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Set visible app as the default browser
# @raycast.mode silent
# @raycast.argument1 { "type": "text", "placeholder": "Browser (brave, chrome, safari, ff, ffd, zen)", "optional": true }

# Optional parameters:
# @raycast.packageName Browsing
# @raycast.icon 🌐

# Documentation:
# @raycast.author William Grant
# @raycast.authorURL https://github.com/yougotwill
# @raycast.description Set visible app as the default browser

# Acknowledgements
# Original author: Yohanes Bandung Bondowoso
# GitHub https://github.com/ybbond

# raycastArgv is Raycast argument
on run {raycastArgv}

if (raycastArgv is equal to "") then

  tell application "System Events"
    tell (first process whose frontmost is true)
      set appName to displayed name
    end tell
  end tell

  set browserName to appName

  if (appName contains "Brave Browser") then
    set browserName to "browser"
  else if (appName is equal to "Safari") then
    set browserName to "safari"
  else if (appName is equal to "Safari Technology Preview") then
    set browserName to "safaritechnologypreview"
  else if (appName contains "Chrome") then
    set browserName to "chrome"
  else if (appName is equal to "Chromium") then
    set browserName to "chromium"
  else if (appName is equal to "Firefox Developer Edition") then
    set browserName to "firefoxdeveloperedition"
  else if (appName is equal to "Firefox") then
    set browserName to "firefox"
  else if (appName is equal to "Zen") then
    set browserName to "zen"
  end if
else
  # appName is used for print log message
  set appName to raycastArgv
  
  if (appName is equal to "brave") then
    set browserName to "browser"
    set appName to "Brave"
  else if (appName is equal to "safari") then
    set browserName to "safari"
    set appName to "Safari"
  else if (appName is equal to "safaritechnologypreview") then
    set browserName to "safaritechnologypreview"
    set appName to "Safari Technology Preview"
  else if (appName is equal to "chrome") then
    set browserName to "chrome"
    set appName to "Chrome"
  else if (appName is equal to "chromium") then
    set browserName to "chromium"
    set appName to "Chromium"
  else if (appName is equal to "ffd") then
    set browserName to "firefoxdeveloperedition"
    set appName to "Firefox Developer Edition"
  else if (appName is equal to "ff") then
    set browserName to "firefox"
    set appName to "Firefox"
  else if (appName is equal to "zen") then
    set browserName to "zen"
    set appName to "Zen"
  else  
    set browserName to raycastArgv
  end if
  
end if  

# display dialog ("Set default browser to " & raycastArgv & "!")

try
	set commandResult to do shell script "defaultbrowser" & space & browserName & space & "2>/dev/null "
	
	if (commandResult contains "The command exited with a non-zero status") then
		log "Shell command 'defaultbrowser' is required."
	else if (commandResult contains "is already set as the default HTTP handler" or commandResult is equal to "") then
		log appName & space & "already set as default browser"
	else if (commandResult contains "is not available as an HTTP handler") then
		log appName & space & "(" & browserName & ")" & space & "is not a web browser, or not handled yet :("
	end if
on error errStr
	set commandResult to errStr
	
	if (commandResult contains "The command exited with a non-zero status") then
		log "Shell command 'defaultbrowser' is required."
	else if (commandResult contains "is already set as the default HTTP handler" or commandResult is equal to "") then
		log appName & space & "already set as default browser"
	else if (commandResult contains "is not available as an HTTP handler") then
		log appName & space & "(" & browserName & ")" & space & "is not a web browser, or not handled yet :("
	end if
end try

try
	tell application "System Events"
		tell application process "CoreServicesUIAgent"
			tell window 1
				tell (first button whose name starts with "use")
					perform action "AXPress"
					log appName & space & "set as default browser"
				end tell
			end tell
		end tell
	end tell
end try

end run
