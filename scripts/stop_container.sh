#!/bin/bash
set -e

# Stop the running container (if any)
ID=$(docker ps | grep tcp | awk -F " " '{print $1}')

if [ -n "$ID" ]; then
    docker rm -f "$ID"
else
    echo "No container to stop."
fi
