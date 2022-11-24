#!/bin/bash

while true
do
  ping -c 4 -i 2 -q google.com > /dev/null

  exit_status=$?
  if [ $exit_status -eq 0 ]; then
    osascript -e 'display notification "check_internet.sh" with title "Connection Status" subtitle "Connected to the Internet! Yay!" sound name "Hero"'
  fi

  sleep 10
done
