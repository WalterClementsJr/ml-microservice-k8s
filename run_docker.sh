#!/usr/bin/env bash

# Build image and add a descriptive tag
docker build --tag=devops-ml .

# List docker images
docker image ls

# Run flask app
docker run -p 8080:80 devops-ml
