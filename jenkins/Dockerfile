ARG REGISTRY
FROM $REGISTRY/alpine:3.10
RUN apk add --no-cache \
    jenkins \
    nss \
    git \
    mercurial \
    openssh-client \
    curl \
    unzip \
    bash \
    coreutils \
    python3
RUN pip3 install tox
ENV JENKINS_HOME /var/lib/jenkins
WORKDIR /var/lib/jenkins
USER jenkins
EXPOSE 8080
CMD ["java", "-Djava.awt.headless=true", "-Xmx1G", "-Xms512M", "-jar", "/usr/share/webapps/jenkins/jenkins.war", "--httpPort=8080"]
