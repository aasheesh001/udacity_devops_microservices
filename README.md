<include a CircleCI status badge, here>

## Project Summary
The ultimate aim of the project is to operationalize this working, machine learning microservice using [kubernetes](https://kubernetes.io/), which is an open-source system for automating the management of containerized applications. 

## Project Files

This project contains various scripts mentioned below:
* Makefile: To Test the project code using linting
* Dockerfile: To setup the docker image
* run_docker.sh: Deploy your containerized application using Docker
* make_prediction.sh: To make predictions while running the app
* run_kubernetes.sh: Deploy a container using Kubernetes and make a prediction
* app.py: Contains the app code

---

## Setting up the Environment

* Create a virtualenv with Python 3.7 and activate it. Refer to this link for help on specifying the Python version in the virtualenv. 
```bash
python3 -m pip install --user virtualenv

# You should have Python 3.7 available in your host. 
# Check the Python path using `which python3`
# Use a command similar to this one:

python3 -m virtualenv --python=<path-to-Python3.7> .devops
source .devops/bin/activate
```
* Run `make install` to install the necessary dependencies

* Install hadolint:
 brew install hadolint

* Run lint checks:
make lint

###### Install kubernetes locally
brew install --cask virtualbox
brew install minikube


### Running `app.py` ###

1. Standalone:  `python app.py`
2. Run in Docker:  `./run_docker.sh`
3. Run in Kubernetes:  `./run_kubernetes.sh`