#!/bin/bash
set -e

# Stop the running container (if any)
ID=`docker ps | grep tcp|awk -F " " '{print $1}'`
docker rm -rf $ID
