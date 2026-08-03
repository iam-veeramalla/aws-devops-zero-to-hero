#!/bin/bash
set -e

IMAGE="samuelepuri/simple-python-flask-app:latest"
CONTAINER="simple-python-flask-app"

echo "Pulling latest image..."
docker pull $IMAGE

echo "Stopping old container (if running)..."
docker stop $CONTAINER || true
docker rm $CONTAINER || true

echo "Starting new container..."
docker run -d \
  --name $CONTAINER \
  -p 5000:5000 \
  $IMAGE

  
