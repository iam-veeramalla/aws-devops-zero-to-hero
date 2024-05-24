#!/bin/sh
echo "deleting the running container"
docker rm $(docker ps -a -f status=exited -q)