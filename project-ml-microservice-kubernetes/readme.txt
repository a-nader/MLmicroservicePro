[![CircleCI](https://circleci.com/gh/a-nader/MLmicroservicePro.svg?style=svg)](https://circleci.com/gh/a-nader/MLmicroservicePro)

Udacity Project - Operationalize a Machine Learning Microservice API
High level steps 
1- Creating a dockers image based docker file, the image contains a lint passed python machine learning prediction microservice
2- Uploading the image to docker hub
3- kubernetes script based on minikube to create a pod from pulled image exposing the needed port
4- run script to make predictions


ec2-user:~/environment/DevOps_Microservices/project-ml-microservice-kubernetes (master) $ ./run_docker.sh 
# See local hadolint install instructions:   https://github.com/hadolint/hadolint
# This is linter for Dockerfiles
hadolint Dockerfile
# This is a linter for Python source code linter: https://www.pylint.org/
# This should be run from inside a virtualenv
pylint --disable=R,C,W1203 app.py


--------------------------------------------------------------------
Your code has been rated at 10.00/10 (previous run: 10.00/10, +0.00)


Sending build context to Docker daemon  753.2kB
Step 1/6 : FROM python:3.7.3-stretch
 ---> 34a518642c76
Step 2/6 : WORKDIR /app
 ---> Using cache
 ---> cd4c3bb56953
Step 3/6 : COPY . /app
 ---> Using cache
 ---> a70f1926b841
Step 4/6 : RUN pip install --upgrade pip &&  pip install -r requirements.txt
 ---> Using cache
 ---> 1990ab9a27f8
Step 5/6 : expose 80
 ---> Using cache
 ---> 51f35d91af75
Step 6/6 : CMD ["python","/app/app.py"]
 ---> Using cache
 ---> 6c3f7a00586a
Successfully built 6c3f7a00586a
Successfully tagged anadersalem/mlms-docker-pro:latest
REPOSITORY                    TAG                 IMAGE ID            CREATED             SIZE
anadersalem/mlms-docker-pro   latest              6c3f7a00586a        35 minutes ago      1.24GB
anadersalem/mlms-docker-pro   <none>              51a29bd97b37        29 hours ago        1.24GB
gcr.io/k8s-minikube/kicbase   v0.0.10             e6bc41c39dc4        2 months ago        974MB
python                        3.7.3-stretch       34a518642c76        12 months ago       929MB
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
app
app
 * Serving Flask app "app" (lazy loading)
 * Environment: production
   WARNING: Do not use the development server in a production environment.
   Use a production WSGI server instead.
 * Debug mode: on
 * Running on http://0.0.0.0:80/ (Press CTRL+C to quit)
 * Restarting with stat
 * Debugger is active!
 * Debugger PIN: 171-005-374
 
^C

ec2-user:~/environment/DevOps_Microservices/project-ml-microservice-kubernetes (master) $ ./upload_docker.sh 
Password: 
WARNING! Your password will be stored unencrypted in /home/ec2-user/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store

Login Succeeded
"docker tag" requires exactly 2 arguments.
See 'docker tag --help'.

Usage:  docker tag SOURCE_IMAGE[:TAG] TARGET_IMAGE[:TAG]

Create a tag TARGET_IMAGE that refers to SOURCE_IMAGE
Docker ID and Image: anadersalem/mlms-docker-pro:latest
The push refers to repository [docker.io/anadersalem/mlms-docker-pro]
b6f9542546c5: Layer already exists 
7038333884e1: Layer already exists 
97cc194f40f6: Layer already exists 
799a7872c8c7: Layer already exists 
715450468940: Layer already exists 
c9d608035aef: Layer already exists 
bb9c02680a15: Layer already exists 
a637c551a0da: Layer already exists 
2c8d31157b81: Layer already exists 
7b76d801397d: Layer already exists 
f32868cde90b: Layer already exists 
0db06dff9d9a: Layer already exists 
latest: digest: sha256:aebcb29166f60c40212489b1c4704a64af3fa382e4309050e0b301c2a8a02af1 size: 2848
 
 
$ ./run_kubernetes.sh 
deployment.apps/mlms-docker-pro created

NAME                              READY   STATUS              RESTARTS   AGE
mlms-docker-pro-5fb75bc9c7-zjr4m  0/1     ContainerCreating   0          13s

Forwarding from 127.0.0.1:8000 -> 80
Forwarding from [::1]:8000 -> 80


$ ./make_prediction.sh 
Port: 8000
{
  "prediction": [
    20.35373177134412
  ]
}
