#!/bin/bash
set -e

# Pull the Docker image from Docker Hub
docker pull 9705663835/simple-python-flask-app

# Run the Docker image as a container
docker run -d -p 5000:5000 9705663835/simple-python-flask-app
