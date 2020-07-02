#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath=anadersalem/mlms-docker-pro:latest

# Step 2
# Run the Docker Hub container with kubernetes
#kubectl run --image $dockerpath mlms-docker-pro --port=80
kubectl create deployment mlms-docker-pro --image=anadersalem/mlms-docker-pro
# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host

kubectl port-forward deployment/mlms-docker-pro 8000:80