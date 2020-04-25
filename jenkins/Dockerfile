ARG REGISTRY
FROM $REGISTRY/alpine:3.11
RUN apk add --no-cache \
    openjdk11-jdk \
    git \
    mercurial \
    openssh-client \
    curl \
    unzip \
    bash \
    ttf-dejavu \
    coreutils \
    py3-tox
ARG VERSION=2.222.3
ARG DIST=jenkins-war-${VERSION}.war
ARG URL=https://repo.jenkins-ci.org/public/org/jenkins-ci/main/jenkins-war/${VERSION}/${DIST}
ARG SHA512=1f0c34bf438d8646085151b0ac4f436d52b8d4f5001490ff79c2ea36379a3911702f993f897cceb782eb854a529d7edeaf642de17806b6f8679a188c97c96f3e
RUN mkdir -p /usr/share/jenkins
RUN wget -O $DIST $URL && \
    echo "expected SHA512=$(sha512sum $DIST)" && \
    echo "$SHA512  $DIST" | sha512sum -c - && \
    mv $DIST /usr/share/jenkins/jenkins.war
RUN adduser -h /var/jenkins_home -s /bin/bash -D jenkins
RUN install -o jenkins -g jenkins -d /var/jenkins_home/plugins
COPY jenkins-support install-plugins.sh jenkins.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/*.sh
ENV PATH=/usr/lib/jvm/java-11-openjdk/bin/:$PATH
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
ENV JENKINS_HOME=/var/jenkins_home
ENV COPY_REFERENCE_FILE_LOG $JENKINS_HOME/copy_reference_file.log
WORKDIR /var/jenkins_home
USER jenkins
EXPOSE 8080
ENTRYPOINT ["/usr/local/bin/jenkins.sh"]
CMD ["java", "-Djava.awt.headless=true", "-Xmx1G", "-Xms512M", "-jar", "/usr/share/jenkins/jenkins.war", "--httpPort=8080"]
