#!/bin/bash
set -e

# Pull the Docker image from Docker Hub
docker pull lakshmi569/ultimate-ci-cd-demo:latest

# Run the Docker image as a container
docker run -d -p 5000:5000 lakshmi569/ultimate-ci-cd-demo:latest 
