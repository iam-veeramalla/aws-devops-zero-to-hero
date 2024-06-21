#!/bin/bash
set -e

# Stop the running container (if any)
ID=`sudo docker ps| awk -f " " {print $1}`
docker rm -rf $ID
