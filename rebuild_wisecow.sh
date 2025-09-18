#!/bin/bash

IMAGE_NAME="wisecow:latest"
CONTAINER_NAME="wisecow_container"

# Step 1: Stop & remove container if exists
if [ "$(docker ps -aq -f name=$CONTAINER_NAME)" ]; then
    echo "Stopping and removing old container: $CONTAINER_NAME..."
    docker rm -f $CONTAINER_NAME
fi

# Step 2: Remove old image if exists
if [ "$(docker images -q $IMAGE_NAME)" ]; then
    echo "Removing old image: $IMAGE_NAME..."
    docker rmi -f $IMAGE_NAME
fi

# Step 3: Build new image
echo "Building new image: $IMAGE_NAME..."
docker build -t $IMAGE_NAME .

# Step 4: Run new container
echo "Starting new container: $CONTAINER_NAME..."
docker run -d --name $CONTAINER_NAME -p 4499:4499 $IMAGE_NAME

echo "Done ✅"
docker ps | grep $CONTAINER_NAME
