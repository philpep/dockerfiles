FROM jenkins/jenkins:lts-alpine
USER root
RUN apk add --no-cache \
    mercurial \
    py3-tox
RUN install-plugins.sh \
    ansicolor \
    cobertura \
    copyartifact \
    configuration-as-code \
    disk-usage \
    embeddable-build-status \
    envinject \
    greenballs \
    htmlpublisher \
    mercurial \
    oic-auth \
    rebuild \
    ssh-agent \
    timestamper \
    ws-cleanup
WORKDIR /var/jenkins_home
USER jenkins
