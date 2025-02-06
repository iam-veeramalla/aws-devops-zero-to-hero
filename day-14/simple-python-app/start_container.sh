#!/bin/bash
set -e

# Pull the Docker images from DockerHub
docker pull anushakirigere/simple-python-flask-app:latest

# Run these Docker images as a container
docker run -d -p 5000:5000 anushakirigere/simple-python-flask-app:latest
