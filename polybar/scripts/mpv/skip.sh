#!/bin/bash

echo '{ "command": ["playlist-next"] }' | socat - /tmp/mpvsocket
