#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath=aasheesh123/udacity-ml-microservice-k8s:latest

# Step 2
# Run the Docker Hub container with kubernetes
kubectl create deploy ml-ms-k8 --image=$dockerpath

# Step 3:
kubectl get pod
podname=$(kubectl get pod | cut -d " " -f1 | grep ml-ms-k8)
sleep 60

# Step 4:
# Forward the container port to a host
kubectl port-forward pod/$podname --address 0.0.0.0 80:80