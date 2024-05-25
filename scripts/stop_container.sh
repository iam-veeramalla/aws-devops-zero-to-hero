#!/bin/bash
set -e
ids=$(docker ps -a -q)
for id in $ids
do
	echo "$id"
 	docker stop $id && dokcer rm &id
done
