#!/bin/bash
set -e

# Pull the Docker image from Docker Hub
docker pull shivpriya/sample-flask:latest

# Run the Docker image as a container
docker run -d -p 5000:5000 shivpriya/sample-flask:latest
