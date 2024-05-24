#!/bin/sh
echo "deleting the running container"
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)