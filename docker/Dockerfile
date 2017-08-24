FROM jenkins/jenkins:lts
ARG docker_gid
ENV DOCKER_API_VERSION 1.31

COPY custom.groovy /usr/share/jenkins/ref/init.groovy.d/custom.groovy
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN xargs /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt && \
    echo 2.0 > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state

USER root
RUN apt-get update && \
    apt-get install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg2 \
        software-properties-common && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/debian \
        $(lsb_release -cs) \
        stable" && \
    apt-get update && \
    apt-get install -y docker-ce

RUN (getent group $docker_gid || addgroup --gid $docker_gid dind) && usermod -a -G $docker_gid jenkins
USER jenkins
