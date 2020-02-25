#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath=chalalaz/ml-microservice

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run --generator=run-pod/v1 --image=$dockerpath machine-learning-app --port=80 --labels='app=machine-learning-app'


# Step 3:
# List kubernetes pods
kubectl get pods

while [ "$(kubectl describe pods machine-learning-app | grep ^Status: | head -1 | awk '{print $2}' | tr -d '\n')" != "Running" ]; do
	echo "Waiting for POD status: $(kubectl describe pods machine-learning-app | grep ^Status: | head -1 | awk '{print $2}' | tr -d '\n')"
done 
echo "POD status is Running"

# Step 4:
# Forward the container port to a host
kubectl port-forward --address 0.0.0.0 pod/machine-learning-app 8000:80


kubectl logs -l app=machine-learning-app --all-containers=true
