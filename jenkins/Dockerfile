ARG REGISTRY
FROM $REGISTRY/debian:bullseye-slim
RUN wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | apt-key --keyring /etc/apt/trusted.gpg.d/jenkins.gpg add -
RUN echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list
RUN apt-get update && apt-get -y install -t bullseye-backports \
    mercurial \
    && apt-get -y install \
    git \
    openssh-client \
    curl \
    unzip \
    tox \
    jenkins \
    openjdk-11-jdk-headless \
    && rm -rf /var/lib/apt/lists/*
COPY jenkins-support install-plugins.sh jenkins.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/*.sh
#ENV PATH=/usr/share/binfmts:$PATH
ENV JENKINS_UC=https://updates.jenkins.io
RUN install-plugins.sh \
    ansicolor \
    cobertura \
    copyartifact \
    configuration-as-code \
    description-setter \
    disk-usage \
    embeddable-build-status \
    envinject \
    greenballs \
    kubernetes \
    htmlpublisher \
    mercurial \
    oic-auth \
    rebuild \
    ssh-agent \
    timestamper \
    ws-cleanup
ENV JENKINS_HOME=/var/lib/jenkins
ENV COPY_REFERENCE_FILE_LOG $JENKINS_HOME/copy_reference_file.log
WORKDIR /var/lib/jenkins
USER jenkins
EXPOSE 8080
ENTRYPOINT ["/usr/local/bin/jenkins.sh"]
CMD ["java", "-Djava.awt.headless=true", "-Xmx1G", "-Xms512M", "-jar", "/usr/share/java/jenkins.war", "--httpPort=8080"]
