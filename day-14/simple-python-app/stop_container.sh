#!/bin/bash
set -e

# Stop the running containers (if any)
contianerid = docker ps | awk -F "" '{print $1}'
docker rm -f $contianerid