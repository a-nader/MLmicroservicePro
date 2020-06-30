#!/usr/bin/env bash

## Complete the following steps to get Docker running locally
python3 -m venv ~/.devops
 source ~/.devops/bin/activate
# Step 1:
# Build image and add a descriptive tag
 make lint
 docker build --tag anadersalem/mlms-docker-pro:latest .

# Step 2: 
# List docker images
 docker image ls
 docker ps
# Step 3: 
# Run flask app
docker stop app
docker rm app
docker run --name app  -p8000:80 anadersalem/mlms-docker-pro:latest
