#!/bin/bash

echo "Testing Blue/Green Deployment"
echo "Press Ctrl+C to stop"
echo ""

while true; do
    RESPONSE=$(curl -s http://localhost:8080/version 2>/dev/null)
    if [ $? -eq 0 ]; then
        VERSION=$(echo $RESPONSE | grep -o '"version":"[^"]*"' | cut -d'"' -f4)
        TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
        echo "[$TIMESTAMP] Version: $VERSION - Response: $RESPONSE"
    else
        echo "$(date '+%Y-%m-%d %H:%M:%S') - Error connecting"
    fi
    sleep 2
done
