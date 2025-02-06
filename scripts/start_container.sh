#!/bin/bash
set -e

# Pull the Docker image from Docker Hub
docker pull hhk14/amazon-payment-app:1.0

# Run the Docker image as a container
docker run -itd --name amazon-payment-app -p 5000:5000 hhk14/amazon-payment-app:1.0
