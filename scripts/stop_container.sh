#!/bin/bash
set -e

# Stop the running container (if any)
container_id=$(docker ps | awk -F" " '{print $1}')

# Check if any running container found
if [ -z "$container_id" ]; then
    echo "No running container found."
    exit 1
fi

# Delete the running container
docker rm -f "$container_id"

echo "Deleted container with ID: $container_id"
