#!/bin/sh

# xinput list gives you the correct id for the trackpad
trackpadId="$(xinput list | grep "Synaptics TouchPad" | sed 's/\(.*id=\)\([0-9]\+\)\s.*/\2/')"
# find out the state
state="$(xinput list-props "$trackpadId" | grep 'Device Enabled' | awk 'BEGIN{FS=":"}{print $2}' | xargs)"

if [ "$?" != "0" ]; then
  i3-nagbar -m 'xinput command failed' -t warning
elif [ "$state" = "0" ]; then
  xinput enable "$trackpadId"
else
  xinput disable "$trackpadId"
fi
