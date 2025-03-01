#!/usr/bin/osascript

# @raycast.title WIP Toggle Grayscale
# @raycast.author William Grant
# @raycast.authorURL https://github.com/yougotwill
# @raycast.description Toggle your display's color mode to grayscale

# @raycast.icon images/contrast-dark.png
# @raycast.iconDark images/contrast.png
# @raycast.mode silent
# @raycast.packageName System
# @raycast.schemaVersion 1

if (TODO) then
  # turn Grayscale on
  do shell script "betterdisplaycli perform --grayscaleFramebuffer"
  do shell script "echo Grayscale turned on"
else
  # turn Grayscale off
  do shell script "betterdisplaycli perform --standardFramebuffer"
  do shell script "echo Grayscale turned off"
end if

