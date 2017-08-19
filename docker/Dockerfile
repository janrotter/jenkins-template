FROM jenkins/jenkins:lts
COPY custom.groovy /usr/share/jenkins/ref/init.groovy.d/custom.groovy
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN xargs /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt && \
    echo 2.0 > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state
