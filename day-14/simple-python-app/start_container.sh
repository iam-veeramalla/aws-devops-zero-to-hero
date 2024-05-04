#!/bin/bash
set -e

# Pull the Docker images from DockerHub
docker push anushakirigere/simple-python-flask-app:tagname

# Run the Docker images as a container
docker run -d -p 5000:5000 anushakirigere/simple-python-flask-app:tagname
