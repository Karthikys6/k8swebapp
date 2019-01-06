## Continuous Deployment of WebApp in K8s using Jenkins Pipeline

###Pre-requisites
minikube
VirtualBox

###Project Layout

```
Myproject/
   Dockerfile         creates jenkins image with pre-installed plugins for k8s
   Myapp/
      Dockerfile      Dockerizes FlaskWebapp - deployment ready
      jenkinsfile     Jenkins pipeline code to build and deploy webapp in k8s
      k8s/
        myapp_deployment.yaml  Deploys webapp to k8s
        myapp_service.yaml     Creates webapp service in k8s
      source/
        App.py                 FlaskApp source
        requirements.txt
        templates              Supporting html files for FlaskApp
   myjenkins_deployment.yaml   Deploys jenkins to k8s
   myjenkins_service.yml       creates jenkins service in k8s
   README.md

```


###References