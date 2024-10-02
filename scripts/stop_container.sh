#!/bin/bash
set -e

# Stop the running container
containerID=$(docker ps -q)
docker rm -f $containerID
