[![WalterClements](https://circleci.com/gh/WalterClementsJr/ml-microservice-k8s.svg?style=svg)](https://circleci.com/gh/walterclementsjr/ml-microservice-k8s)

## Project Overview

You are given a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on.
You can read more about the data, which was initially taken from Kaggle, on [the data source site](https://www.kaggle.com/c/boston-housing).
This project tests your ability to operationalize a Python flask app—in a provided file, `app.py`—that serves out predictions (inference) about housing prices through API calls.
This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling.

### Project Tasks

Your project goal is to operationalize this working, machine learning microservice using [kubernetes](https://kubernetes.io/), which is an open-source system for automating the management of containerized applications. In this project you will:
* Test your project code using linting
* Complete a Dockerfile to containerize this application
* Deploy your containerized application using Docker and make a prediction
* Improve the log statements in the source code for this application
* Configure Kubernetes and create a Kubernetes cluster
* Deploy a container using Kubernetes and make a prediction
* Upload a complete Github repo with CircleCI to indicate that your code has been tested

You can find a detailed [project rubric, here](https://review.udacity.com/#!/rubrics/2576/view).

---

## Setup the Environment

* Create a virtualenv with Python 3.7 and activate it.
* Refer to this link for help on specifying the Python version in the virtualenv.

```bash
python3 -m pip install --user virtualenv
# You should have Python 3.7 available in your host. 
# Check the Python path using `which python3`
# Use a command similar to this one:
python3 -m virtualenv --python=<path-to-Python3.7> .
source .devops/bin/activate
```
* Run `make install` to install the necessary dependencies

### Running `app.py`

1. Standalone: `python app.py`
2. Run in Docker: `./run_docker.sh`
3. Run in Kubernetes: `./run_kubernetes.sh`

### Kubernetes Steps

* Setup and Configure Docker locally
  * Go to https://www.docker.com/products/docker-desktop/ and follow the instruction to install docker desktop
  * Verify installation by `docker --version`

* Setup and Configure Kubernetes locally
  - using Docker Desktop on Win10:
    Go into the setting -> Kubernetes -> Enable Kubernetes
  - Verify installation using `kubectl version --output yaml`
* Create Flask app in Container: `./run_docker.sh`
* Push image to Dockerhub: `./upload_docker.sh`
* Run via kubectl
  - run `./run_kubernetes.sh`
  - Check if the pod is in READY state: `kubectl get pods`
  - run `./run_kubernetes.sh` again.
    forward the port 8080:80 and then visit localhost:8080

### Description of the files

- .circleci/config.yml CircleCI configuration
- .dockerignore: Ignore the file when using COPY command in Dockerfile
- app.py: API for predicting house pricing
- output_txt_files/: Docker and Kubernetes log output
- Dockerfile: Dockerfile containing the application and its dependencies
- make_prediction.sh: Calls prediction REST endpoint and simulates sample prediction
- Makefile: instruction to set up environment, install dependencies, test and lint
- README.md: This file is containing help content.
- requirements.txt: python dependencies to run app.py.
- run_docker.sh: Shell script for creating and running docker container
- run_kubernetes.sh: Shell script to deploy docker container on Kubernetes cluster
- upload_docker.sh: Shell script for uploading docker image to dockerhub repository
- `make_prediction.sh`: Calls prediction API endpoint and get prediction
