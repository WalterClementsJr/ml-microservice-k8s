#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

dockerpath=walterclementsjr/devops-ml

# Run the Docker Hub container with kubernetes
r=$(kubectl get pod devops-ml 2> /dev/null;echo $?)

if [ "_$r" == "_1" ] ; then
    kubectl run devops-ml \
    --image=$dockerpath \
    --image-pull-policy="Always" \
    --overrides='{"apiVersion": "v1", "spec":{"imagePullSecrets": [{"name": "regcred"}]}}'
fi

# List kubernetes pods
kubectl get pods

# Forward the container port to a host
kubectl port-forward devops-ml 8080:80
