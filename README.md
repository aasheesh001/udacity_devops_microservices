# Build Status for Master branch
[![aasheesh001](https://circleci.com/gh/aasheesh001/udacity_devops_microservices.svg?style=svg)](https://github.com/aasheesh001/udacity_devops_microservices/blob/master/README.md)

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
```
python3 -m venv ~/.devops
source ~/.devops/bin/activate
# You should have python 3 installed on your machine
```
* Install the necessary dependencies using the make file, if you don't have make package installed, please install it using the appropriate package manager.
```make install
```
* Install hadolint:
```#For Mac:
brew install hadolint

#For Windows:
scoop install hadolint
```

* Run lint checks:
```make lint
```

###### Install kubernetes locally
```
#For Mac:
brew install --cask virtualbox
brew install minikube

### For Windows use these documentation: 
## https://www.virtualbox.org/wiki/Downloads
## https://minikube.sigs.k8s.io/docs/start/
```
###### Verify your installation
```
kubectl version
docker --version
```
git clone https://github.com/udacity/DevOps_Microservices.git

## Working steps
* Clone the repository
```git clone https://github.com/udacity/DevOps_Microservices.git
```

* Run the below command to create the docker image and run the app on docker
```./run_docker.sh
```

* While the above command is running and you see that the app is up and running, use the below script to make predictions on another terminal:
```./make_prediction.sh
```
* Once the prediction is complete press CTRL+D to exit from the first terminal

* Deploy the image on Kubernetes using the below command:
```./run_kubernetes.sh
```
* Use the same script to make predictions as used with docker.

## How to Test locally without using script:

* The Dockerfile is already completed, make necessary changes accordingly as per your requirements

* Build the image:
```docker build -t aasheesh123/udacity-ml-microservice-k8s:latest .
```

* You can find the image in your machine by using the below command:
```docker image ls
```

* To run your image in a docker container and expose it on a local port use the below command:
```docker run -p 80:80 aasheesh123/udacity-ml-microservice-k8s:latest
```
* You can now make the prediction using the script `make_prediction.sh`

* The next steps are for Kubernetes deployment, you can deploy your image to a Kubernetes cluster using the below command:
```
#Used to start the minikube cluster
minikube start    

# Run the container
dockerpath=aasheesh123/udacity-ml-microservice-k8s:latest
kubectl create deploy ml-ms-k8 --image=$dockerpath

# List your pods
kubectl get pod

# Once your pod is running export its name in an env variable
podname=$(kubectl get pod | cut -d " " -f1 | grep ml-ms-k8)

# Forward the container port to a host
kubectl port-forward pod/$podname --address 0.0.0.0 80:80

```
* You can now make the prediction using the script `make_prediction.sh`

* Once your testing is done make sure to destroy the pods and stop minikube
```
kubectl delete deploy ml-ms-k8 
minikube stop
```