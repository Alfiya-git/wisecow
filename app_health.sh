#!/bin/bash

APP_URL="http://localhost:4499"  # Change this to your app URL

HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$APP_URL")

if [ "$HTTP_CODE" -eq 200 ]; then
  echo "App is UP ($APP_URL)"
else
  echo "App is DOWN ($APP_URL), Status: $HTTP_CODE"
fi
