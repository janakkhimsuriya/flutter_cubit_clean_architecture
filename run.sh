#!/bin/bash

# List of device IDs
devices=("168418AD-60B7-4C14-8381-FDA53644873F" "52B717ED-1959-43C0-98A1-8ECF39775644")

# Path to the environment file
env_file=".env/dev.json"

# Run the app on each device
for device in "${devices[@]}"
do
  echo "Running on device: $device"
  flutter run -d "$device" --flavor dev --dart-define-from-file="$env_file" &
done

wait