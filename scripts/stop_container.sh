#!/bin/bash
set -e

# Stop the running container (if any)
container_id=$(docker ps | awk -F' ' '{print $1}')

# Check if any running container found
if [ -n "$container_id" ]; then
    # Delete the running container
    docker rm -f "$container_id"
    echo "Deleted container with ID: $container_id"
fi
