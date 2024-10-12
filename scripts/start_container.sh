#!/bin/bash
set -e

# Pull the Docker image from Docker Hub
docker pull vijaymguru/simple-python-flash-app

# Run the Docker image as a container
docker run -d -p 5000:5000 vijaymguru/simple-python-flash-app
