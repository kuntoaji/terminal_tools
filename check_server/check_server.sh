#!/bin/bash

# How to use: ./check_server.sh example.com

# -c <number>: Stop after sending <number> packages
# -q: quiet output
domain=$1

echo "Checking ${domain}"
ping -c 3 -q $domain > /dev/null
exit_status=$?

if [ $exit_status -eq 0 ]; then
  echo "${domain} is up"
fi

echo "Monitoring the status of ${domain} every 1 minute"

while true
do
  # -c <number>: Stop after sending <number> packages
  # -q: quiet output
  ping -c 3 -q $domain > /dev/null
  exit_status=$?

  if [ $exit_status -ne 0 ]; then
    osascript -e 'display notification "check_server.sh" with title "Status" subtitle "Server is down!" sound name "Hero"'
  fi

  # check every 1 minute
  sleep 60
done
