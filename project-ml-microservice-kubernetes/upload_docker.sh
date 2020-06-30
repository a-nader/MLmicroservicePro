#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
# dockerpath=<your docker ID/path>
dockerpath=anadersalem/mlms-docker-pro:latest
# Step 2:  
# Authenticate & tagA
docker login --username anadersalem
docker tag mlms-docker-pro:latest
echo "Docker ID and Image: $dockerpath"
# Step 3:
# Push image to a docker repository
docker push $dockerpath
