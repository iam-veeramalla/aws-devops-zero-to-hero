#!/bin/bash
set -e

# Pull the Docker image from Docker Hub
docker pull santhu8892/simple-python-flask-app/

# Run the Docker image as a container
docker run -d -p 5000:5000 santhu8892/simple-python-flask-app
