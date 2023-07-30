#!/bin/bash
set -e

# Stop the running container (if any)
container-id=`docker ps | awk {{ $print $1}}`
docker rm -rf $container-id