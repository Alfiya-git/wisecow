#!/bin/bash

# Stop and remove the container if it exists
if [ "$(docker ps -aq -f name=wisecow_container)" ]; then
    echo "Stopping and removing container wisecow_container..."
    docker rm -f wisecow_container
else
    echo "No container named wisecow_container found."
fi

# Remove the image if it exists
if [ "$(docker images -q wisecow:latest)" ]; then
    echo "Removing image wisecow:latest..."
    docker rmi -f wisecow:latest
else
    echo "No image named wisecow:latest found."
fi

echo "Cleanup complete"
