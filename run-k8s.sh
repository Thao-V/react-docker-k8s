#!/bin/bash
# Start Minikube
minikube start --driver=docker

# Use Minikube’s Docker
eval $(minikube docker-env)

# Build image locally
docker build -t react-app:v1 .

# Deploy to K8s
kubectl apply -f deployment.yml
kubectl apply -f service.yml

# Open app and dashboard
minikube service react-app-service --url
# minikube dashboard
