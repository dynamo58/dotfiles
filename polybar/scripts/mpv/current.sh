#!/bin/bash

# gets the name of file being played by mpv
# requires for there to be an mpv socket at /tmp/mpvsocket

# for example, by putting `input-ipc-server=/tmp/mpvsocket` into mpv.conf

# use a trick to see if a no GUI audio is playing, otherwise do nothing
if [  "$(echo '{ "command": ["get_property", "focused"] }' | socat - /tmp/mpvsocket | jq ".error")"  = "\"property unavailable\"" ]
then
    FILE_NAME=$(echo '{ "command": ["get_property", "filename"] }' | socat - /tmp/mpvsocket | jq ".data" | sed 's/"//g');

	echo " ${FILE_NAME%.*}                                                             "
else
	echo ""
fi
