#!/bin/bash

# https://www.railsmine.net/2022/11/script-check-internet-connection-and-create-notification-apple-mac.html

while true
do
  # -c <number>: Stop after sending <number> packages
  # -q: quiet output
  ping -c 3 -q google.com > /dev/null
  exit_status=$?

  if [ $exit_status -eq 0 ]; then
    osascript -e 'display notification "check_mac_internet.sh" with title "Connection Status" subtitle "Connected to the Internet! Yay!" sound name "Hero"'
  fi

  sleep 10
done
