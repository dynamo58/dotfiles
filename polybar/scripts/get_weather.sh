#!/usr/bin/bash

# gets the raw temperature in Celsius
# wttr.in automatically determines the are based on IP, if you want to hardcode a location, try
	# changing the IP to something like https://wttr.in/YOUR_LOCATION?format=j1
curl https://wttr.in/?format=j1 | jq ".current_condition[0].FeelsLikeC" | sed 's/"//g'
