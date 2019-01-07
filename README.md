## Deployment of WebApp in K8s using Jenkins Pipeline

### Pre-requisites
minikube

VirtualBox

### Project Layout

```
Myproject/
   Dockerfile     -->creates jenkins image with pre-installed plugins for k8s deployment
   Myapp/
      Dockerfile  -->Dockerizes FlaskWebapp - deployment ready
      jenkinsfile -->Jenkins pipeline code to build and deploy webapp in k8s
      k8s/
        myapp_deployment.yaml -->Deploys webapp to k8s
        myapp_service.yaml    -->Creates webapp service in k8s
      source/
        App.py                -->FlaskWebApp source
        requirements.txt
        templates             -->Supporting html-files for FlaskApp
   myjenkins_deployment.yaml  -->Deploys jenkins to k8s
   myjenkins_service.yml      -->creates jenkins service in k8s
   README.md

```
After successful setup of k8s cluster using minikube.

### Steps to Execute the Project

#### Preparing k8s Jenkins Environment for WebApp Deployment

* Clone the repository

* Build docker image for jenkins with required plugins. Use the Dockerfile under MyProject/
```
docker build -t <repo>/<image>:<VersionTag> .
```
* Update the image details in myjenkins_deployment.yaml
* Deploy jenkins in k8s
```
kubectl create -f myjenkins_deployment.yaml
```
* Create a jenkins service in k8s
```
kubectl create -f myjenkins_service.yaml
```
* You can access jenkins via 
```
<cluster-ip>:<nodeport>
```
* Configure kubernetes plugin to spin up Jenkins Slave on-demand by configuring pod and container templates accordingly

#### Preparing Jenkins pipeline script for WebApp (MyApp Directory) Deployment
* Configure Pod template to run docker and kubectl commands in Slave pods
* Dockerize WebApp
* Push the image to Registry
* Deploy to K8s

#### Configure Jenkins Job to Run Pipeline on 'Slave' Pod
* Checkout Repo from Github
* Call Jenkinfile from MyApp directory

### References
https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.13/#deployment-v1-apps
https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.13/#service-v1-core
https://github.com/jenkinsci/kubernetes-plugin
