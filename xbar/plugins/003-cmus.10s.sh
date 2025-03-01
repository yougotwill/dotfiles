#!/bin/bash

# Edited by William Grant
# FORMAT Strings https://linux.die.net/man/1/cmus
#
# Displays the current track being played by `cmus`, a console music player.
# All thanks to the cmus-remote.
#
# originally written by Michael Chris Lopez (hello@michaelchris.space)
# based on Spotify script by Jason Tokoph (jason@tokoph.net)
#
# Choose to launch cmus in iTerm2 (version 2.9.20150414+ only), Terminal or Kitty
#
# Metadata:
# <xbar.title>Cmus Now Playing</xbar.title>
# <xbar.version>v1.0</xbar.version>
# <xbar.author>Michael Chris Lopez</xbar.author>
# <xbar.author.github>mcchrish</xbar.author.github>
# <xbar.desc>Displays currently playing song from cmus. Control cmus in menubar.</xbar.desc>
# <xbar.image>https://i.imgur.com/qeZCB0a.png</xbar.image>

if [ "$1" = 'launch-iterm' ]; then
  if [ "$(osascript -e 'application "iTerm" is running')" = "false" ]; then
    osascript -e 'tell application "iTerm" to activate'
    osascript -e 'tell application "iTerm" to tell current session of current window to write text "cmus"'
  else
    # Then create new tab
    osascript -e 'tell application "iTerm" to tell current window to set newTab to (create tab with default profile)'
    osascript -e 'tell application "iTerm" to tell current window to tell current tab to tell current session to write text "cmus"'
  fi

  exit
fi

if [ "$1" = 'launch-kitty' ]; then
  if [ "$(osascript -e 'application "Kitty" is running')" = "false" ]; then
    osascript -e 'tell application "Kitty" to activate'
    osascript -e 'tell application "Terminal" to do script "cmus" in window 1'
  else
    # Then create new tab
    osascript -e 'tell application "System Events" to keystroke "t" using command down'
    osascript -e 'tell application "Kitty" to do script "cmus" in tab 2 of window 1'
  fi

  exit
fi

if [ "$1" = 'launch-terminal' ]; then
  if [ "$(osascript -e 'application "Terminal" is running')" = "false" ]; then
    osascript -e 'tell application "Terminal" to activate'
    osascript -e 'tell application "Terminal" to do script "cmus" in window 1'
  else
    # Then create a new tab
    osascript -e 'tell application "System Events" to keystroke "t" using command down'
    osascript -e 'tell application "Terminal" to do script "cmus" in tab 2 of window 1'
  fi

  exit
fi

state=$(cmus-remote -C status | sed -n 1p | cut -d " " -f2)

if [ "$state" = "" ]; then
  echo "♫ | color=gray"
  echo "---"
  echo "cmus is not running"
  echo "Launch cmus in Kitty | bash='$0' param1=launch-kitty terminal=false refresh=true"
  echo "Launch cmus in iTerm | bash='$0' param1=launch-iterm terminal=false refresh=true"
  echo "Launch cmus in Terminal | bash='$0' param1=launch-terminal terminal=false refresh=true"
  exit
fi

if [ "$1" = 'playpause' ]; then
  cmus-remote --pause
  exit
fi

if [ "$1" = 'previous' ]; then
  cmus-remote --prev
  exit
fi

if [ "$1" = 'next' ]; then
  cmus-remote --next
  exit
fi

if [ "$1" = 'seekfoward' ]; then
  cmus-remote --seek +1m
  exit
fi

if [ "$1" = 'seekbackward' ]; then
  cmus-remote --seek -1m
  exit
fi

if [ "$1" = 'shuffle' ]; then
  cmus-remote --shuffle
  exit
fi

if [ "$1" = 'repeat' ]; then
  cmus-remote --repeat
  exit
fi

if [ "$1" = 'follow' ]; then
  cmus-remote -C "toggle follow"
  exit
fi

if [ "$1" = 'continue' ]; then
  cmus-remote -C "toggle continue"
  exit
fi

if [ "$state" = "playing" ]; then
  state_icon="▶"
else
  state_icon="❚❚  | color=gray"
fi

track=$(cmus-remote -C "format_print %{title}")
artist=$(cmus-remote -C "format_print %{artist}")
album=$(cmus-remote -C "format_print %{album}")
filename=$(cmus-remote -C "format_print %{filename}")
position=$(cmus-remote -C "format_print %{position}")
duration=$(cmus-remote -C "format_print %{duration}")
shuffle=$(cmus-remote -C "format_print %{shuffle}")
repeat=$(cmus-remote -C "format_print %{repeat}")
follow=$(cmus-remote -C "format_print %{follow}")
continue=$(cmus-remote -C "format_print %{continue}")

if [ "$track" = "" ]; then
  echo "${filename:0:40}...  $state_icon"
else
  if ["${#track}" -ge 40]; then
    echo "${track:0:40}... $state_icon"
  else
    echo "${track} $state_icon"
  fi
fi

echo "---"

case "$0" in
  *\ * )
   echo "Your script path | color=#ff0000"
   echo "($0) | color=#ff0000"
   echo "has a space in it, which Xbar does not support. | color=#ff0000"
   echo "Play/Pause/Next/Previous buttons will not work. | color=#ff0000"
  ;;
esac

if [ "$state" = "playing" ]; then
  echo "Pause | bash='$0' param1=playpause terminal=false refresh=true"
  echo "Previous | bash='$0' param1=previous terminal=false refresh=true"
  echo "Next | bash='$0' param1=next terminal=false refresh=true"
  echo "---"
  echo "Seek Forward | bash='$0' param1=seekfoward terminal=false refresh=true"
  echo "Seek Backward | bash='$0' param1=seekbackward terminal=false refresh=true"
  echo "Shuffle | bash='$0' param1=shuffle terminal=false refresh=true"
  echo "Repeat | bash='$0' param1=repeat terminal=false refresh=true"
  echo "Follow | bash='$0' param1=follow terminal=false refresh=true"
  echo "Continuous Playback | bash='$0' param1=continue terminal=false refresh=true"
else
  echo "Play | bash='$0' param1=playpause terminal=false refresh=true"
fi

echo "---"
echo "Track: $track | color=#333333 length=80"
echo "Artist: $artist | color=#333333 length=80"
echo "Album: $album | color=#333333 length=80"
echo "File: $filename | color=#333333 length=80"
echo "Progress: $position / $duration | color=#333333 length=80"

echo "---"
if [ "$shuffle" = "S" ]; then
  echo "Shuffle: On"
else
  echo "Shuffle: Off"
fi

if [ "$repeat" = "R" ]; then
  echo "Repeat: On"
else
  echo "Repeat: Off"
fi

if [ "$follow" = "F" ]; then
  echo "Follow: On"
else
  echo "Follow: Off"
fi

if [ "$continue" = "C" ]; then
  echo "Continuous Playback: On"
else
  echo "Continuous Playback: Off"
fi

echo "---"
echo "Open cmus | bash='$0' param1=launch-kitty terminal=false refresh=true"
