#!/usr/bin/bash

# gets the raw temperature in Celsius
curl https://wttr.in/?format=j1 | jq ".current_condition[0].FeelsLikeC" | sed 's/"//g'
