#!/bin/bash

# Edited by William Grant

# <xbar.title>Now playing</xbar.title>
# <xbar.version>v1.1</xbar.version>
# <xbar.author>Adam Kenyon</xbar.author>
# <xbar.author.github>adampk90</xbar.author.github>
# <xbar.desc>Shows and controls the music that is now playing. Currently supports Spotify, iTunes, Vox.</xbar.desc>
# <xbar.image>https://pbs.twimg.com/media/CbKmTS7VAAA84VS.png:small</xbar.image>
# <xbar.dependencies></xbar.dependencies>
# <xbar.abouturl></xbar.abouturl>

# first, determine if there's an app that's playing or paused
apps=(Music Spotify Vox)
playing=""
paused=""

# Determine if we are running a pre-Catalina OS X version and adjust the apps accordingly.
osx_ver_before_catalina=$(sw_vers -productVersion | grep -E "10\.\d[0-4]+\..*")
if [ -n "$osx_ver_before_catalina" ]; then
  apps=(iTunes Spotify Vox)
fi

for i in "${apps[@]}"; do
  # is the app running?
  app_state=$(osascript -e "application \"$i\" is running")

  # shellcheck disable=SC2181
  if [ "$?" != "0" ]; then
    # just exit if there was an error determining the app's state
    # (the app might be in the middle of quitting)
    exit
  fi

  if [ "$app_state" = "true" ] && [ "$track" = "" ]; then
    # yes, it's running
    # is it playing music currently?
    app_playing=$(osascript -e "tell application \"$i\" to player state as string")
    if [ "$app_playing" = "paused" ] || [ "$app_playing" = "0" ]; then
      # nope, it's paused
      paused="$i"
    elif [ "$app_playing" = "playing" ] || [ "$app_playing" = "1" ]; then
      # yes, it's playing
      playing="$i"
    fi
  fi
done


# open a specified app
if [ "$1" = "open" ]; then
  osascript -e "tell application \"$2\" to activate"
  exit
fi
# play/pause
if [ "$1" = "play" ] || [ "$1" = "pause" ]; then
  osascript -e "tell application \"$2\" to $1"
  exit
fi
# next/previous
if [ "$1" = "next" ] || [ "$1" = "previous" ]; then
  osascript -e "tell application \"$2\" to $1 track"
  # tell spotify to hit "Previous" twice so it actually plays the previous track
  # instead of just starting from the beginning of the current one
  if [ "$playing" = "Spotify" ] && [ "$1" = "previous" ]; then
    osascript -e "tell application \"$2\" to $1 track"
  fi
  osascript -e "tell application \"$2\" to play"
  exit
fi
# shuffle/repeat
if [ "$1" = "shuffling" ]  || [ "$1" = "repeating" ]; then
  osascript -e "tell application \"$2\" to set $1 to not $1"
  exit
fi


# start outputting information to bitbar
if [ "$playing" = "" ] && [ "$paused" = "" ]; then
  # nothing is even paused
  echo "♫ | color=gray"
else
  # something is playing or is paused
  track=""
  artist=""
  album=""
  position=""
  duration=""
  shuffle_state=""
  repeat_state=""

  if [ "$playing" = "" ]; then
    echo "$paused ❚❚ | color=#888888"
    echo "---"
    app="$paused"
  else
    app="$playing"
  fi

  track_query="name of current track"
  artist_query="artist of current track"
  album_query="album of current track"
  position_query="tell application \"$app\"
    set pos_sec to player position
    set time_min to (pos_sec / 60 div 1) as text
    set raw_sec to (pos_sec mod 60 div 1) as text
    if length of raw_sec is greater than 1 then
        set time_sec to raw_sec
    else
        set time_sec to \"0\" & raw_sec
    end if
    return time_min as text & \":\" & time_sec as text
  end tell"
  duration_query="tell application \"$app\"
    set total_sec to (duration of current track / 1000) as text
    set time_min to (total_sec / 60 div 1) as text
    set raw_sec to (total_sec mod 60 div 1) as text
    if length of raw_sec is greater than 1 then
        set time_sec to raw_sec
    else
        set time_sec to \"0\" & raw_sec
    end if
    return time_min as text & \":\" & time_sec as text
  end tell"
  shuffle_state_query="shuffling"
  repeat_state_query="repeating"

  # Vox uses a different syntax for track and artist names
  if [ "$app" = "Vox" ]; then
    track_query="track"
    artist_query="artist"
    album_query="album"
  fi

  # output the track and artist
  track=$(osascript -e "tell application \"$app\" to $track_query")
  artist=$(osascript -e "tell application \"$app\" to $artist_query")
  album=$(osascript -e "tell application \"$app\" to $album_query")
  position=$(osascript -e "$position_query")
  duration=$(osascript -e "$duration_query")
  shuffle_state=$(osascript -e "tell application \"$app\" to $shuffle_state_query")
  repeat_state=$(osascript -e "tell application \"$app\" to $repeat_state_query")

  if [ "$playing" != "" ]; then
    if [ "${#track}" -ge 40 ]; then
       echo "${track:0:40}… ▶"
    else
      echo "${track} ▶"
    fi
    echo "---"
  fi

  if [ "$playing" != "" ]; then
    echo "Pause | bash='$0' param1=pause param2=$app refresh=true terminal=false"
    echo "Next | bash='$0' param1=next param2=$app refresh=true terminal=false"
    echo "Previous | bash='$0' param1=previous param2=$app refresh=true terminal=false"
    echo "---"
    echo "Shuffle | bash='$0' param1=shuffling param2=$app refresh=true terminal=false"
    echo "Repeat | bash='$0' param1=repeating param2=$app refresh=true terminal=false"
  else
    echo "Play | bash='$0' param1=play param2=$app refresh=true terminal=false"
  fi
fi

echo "---"
echo "Track: $track | color=#333333 length=80"
echo "Artist: $artist | color=#333333 length=80"
echo "Album: $album | color=#333333 length=80"
echo "Progress: $position / $duration | color=#333333 length=80"
echo "---"
if [ "$shuffle_state" = "true" ]; then
  echo "Shuffle: On"
else
  echo "Shuffle: Off"
fi

if [ "$repeat_state" = "true" ]; then
  echo "Repeat: On"
else
  echo "Repeat: Off"
fi

# add an Open option for each service
echo "---"
for i in "${apps[@]}"; do
  echo "Open $i | bash='$0' param1=open param2=$i terminal=false"
done
