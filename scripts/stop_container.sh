#!/bin/bash
set -e

LOG_FILE="/var/log/stop_container.log"

# Log function
log() {
    echo "$(date +'%Y-%m-%d %H:%M:%S') $1" >> "$LOG_FILE"
}

# Stop the running container (if any)
ID=$(docker ps | grep tcp | awk -F " " '{print $1}')
log "Container ID found: $ID"

if [ -n "$ID" ]; then
    log "Stopping and removing container $ID"
    docker rm -f "$ID"
    log "Container $ID removed successfully"
else
    log "No container to stop."
fi
