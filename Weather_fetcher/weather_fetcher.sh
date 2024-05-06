#!/bin/bash

# Check if a location is provided as an argument; if not, set a default location
if [ -z "$1" ]; then
  LOCATION="London"
else
  LOCATION="$1"
fi

# Define the output file (optional)
OUTPUT_FILE="weather.txt"

# Fetch the weather information from wttr.in for the specified location
WEATHER_INFO=$(curl -s "http://wttr.in/${LOCATION}?format=3")

# Check if the fetch was successful
if [ -z "$WEATHER_INFO" ]; then
  echo "Error: Could not fetch weather information for ${LOCATION}."
  exit 1
fi

# Display the weather information
echo "Weather for ${LOCATION}:"
echo "${WEATHER_INFO}"

# Write the weather information to a file (optional)
echo "${WEATHER_INFO}" >>  ${OUTPUT_FILE}

echo "Weather information has been saved to ${OUTPUT_FILE}."
