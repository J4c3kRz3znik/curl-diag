#!/bin/bash

if [ -z "$1" ]; then
  echo "Use: $0 http://<URL>/ or https://<URL>/"
  exit 1
fi

URL=$1

while true; do
  start=$(date +%s%3N)
  curl -s -o /dev/null -w "%{http_code}" -k --connect-timeout 7 $URL > /dev/null
  end=$(date +%s%3N)
  
  duration=$((end - start))
  
  echo "Response Time from $URL: ${duration} ms"
  
  sleep 1
done
