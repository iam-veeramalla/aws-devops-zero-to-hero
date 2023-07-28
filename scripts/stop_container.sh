#!/bin/bash
set -e
if [ "$(docker container ls -aq)" = " " ]
then
    echo ""
else
    docker container stop $( docker container ls -aq)
    docker container rm $( docker container ls -aq)
    echo "older container removed successfully"
fi
