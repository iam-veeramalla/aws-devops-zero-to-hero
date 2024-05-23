#!/bin/sh
echo "deleting the running container"
ids=$(docker ps -a -q)
for id in $ids
do
  echo "$id"
  docker stop $id && docker rm $id
done
