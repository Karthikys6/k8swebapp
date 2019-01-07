from jenkins/jenkins:latest

# Source Control
RUN /usr/local/bin/install-plugins.sh github

# Pipeline 
RUN /usr/local/bin/install-plugins.sh workflow-aggregator

# SSH-Slaves
RUN /usr/local/bin/install-plugins.sh ssh-slaves

# Deploy
RUN /usr/local/bin/install-plugins.sh kubernetes

USER jenkins