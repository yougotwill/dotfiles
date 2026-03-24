
#!/bin/zsh
# Restarts the currently used window manager. 
# Useful for global keyboard shortcuts and scripting

# Amethyst
# osascript -e 'quit app "Amethyst"' && sleep 2 && open -a "Amethyst.app"

# OmniWM
# osascript -e 'quit app "OmniWM"' && sleep 2 && open -a "OmniWM.app"

# Paneru
/Users/will/.cargo/bin/paneru restart
