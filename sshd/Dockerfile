ARG REGISTRY
FROM $REGISTRY/alpine:3.11
RUN apk add --no-cache \
    less \
    grep \
    tar \
    tmux \
    openssh-server \
    rsync \
    zsh \
    bash \
    irssi \
    git \
    vim \
    python3 \
    openssh-client \
    curl \
    mercurial
RUN apk add --no-cache py3-pip && \
    python3 -m pip install --no-cache-dir --disable-pip-version-check 'hg-evolve>=9.2.1' && \
    apk del py3-pip
RUN apk add --no-cache tzdata && \
    cp /usr/share/zoneinfo/Europe/Paris /etc/localtime && \
    echo "Europe/Paris" > /etc/timezone && \
    apk del tzdata
ENV LANG en_US.UTF-8
EXPOSE 22/tcp
CMD ["/usr/sbin/sshd", "-D", "-e"]
