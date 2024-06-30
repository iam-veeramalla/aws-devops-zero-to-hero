#!/bin/bash
set -e

# Pull the Docker image from Docker Hub
docker pull hariknag/sample-python-flask-app100

# Run the Docker image as a container
docker run -d -p 5000:5000 hariknag/sample-python-flask-app100
