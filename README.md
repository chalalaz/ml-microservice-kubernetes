**CircleCI Public Status:** [![CircleCI](https://circleci.com/gh/chalalaz/ml-microservice-kubernetes.svg?style=svg)](https://circleci.com/gh/chalalaz/ml-microservice-kubernetes)

## Project Overview

In this project, you will apply the skills you have acquired in this course to operationalize a Machine Learning Microservice API. 

You are given a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. You can read more about the data, which was initially taken from Kaggle, on [the data source site](https://www.kaggle.com/c/boston-housing). This project tests your ability to operationalize a Python flask app—in a provided file, `app.py`—that serves out predictions (inference) about housing prices through API calls. This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling.

---

## Setup the Environment

#####Create a virtualenv and activate it
1. Create an environment: `python -m venv ~/.devops`
2. Set your environment: `source ~/.devops/bin/activate`
3. Install dependencies: `make install` or `pip install -r requirements.txt`
4. Run app: `python app.py`

### Running `app.py`

1. Standalone:  `python app.py`
2. Run in Docker:  `./run_docker.sh`
3. Run in Kubernetes:  `./run_kubernetes.sh`

### Kubernetes Steps

1. [Setup and Configure Docker locally](https://docs.docker.com/install/).
2. [Setup kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/).
3. [Setup Minikube](https://kubernetes.io/docs/tasks/tools/install-minikube/).
4. Create secret for Docker hub to get image.\
   `kubectl create secret docker-registry regcred --docker-server=https://hub.docker.com/ --docker-username=YourUsername --docker-    password=YourPassword --docker-email=your_email@mail.com`
5. run image to Containers\
   `kubectl run --generator=run-pod/v1 --image=YourDockerPath machine-learning-app --port=80 --labels='app=machine-learning-app'`

### Testing Prediction 
   After application is running do prediction by run script.\
   `./make_prediction.sh`
