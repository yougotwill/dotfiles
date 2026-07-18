
#!/bin/zsh
# Restarts any running window managers.
# Used for global keyboard shortcuts and scripting when the wm doesn't have a reliable reset command.

# Amethyst
if pgrep -il "amethyst" >/dev/null; then
  osascript -e 'quit app "Amethyst"' && sleep 2 && open -a "Amethyst.app"
fi

# Nehir
if pgrep -il "nehir" >/dev/null; then
  osascript -e 'quit app "Nehir"' && sleep 2 && open -a "Nehir.app"
fi

# OmniWM
if pgrep -il "omniwm" >/dev/null; then
  osascript -e 'quit app "OmniWM"' && sleep 2 && open -a "OmniWM.app"
fi

# Paneru
if pgrep -il "paneru" >/dev/null; then
  /Users/will/.cargo/bin/paneru stop && sleep 2 && /Users/will/.cargo/bin/paneru restart
fi

osascript -e 'tell application "BetterTouchTool" to display_notification "Restarted 🔄" with title "Window Manager"'
