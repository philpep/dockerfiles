ARG REGISTRY
FROM $REGISTRY/debian:bullseye-slim
RUN apt-get update && apt-get -y install \
    tmux \
    openssh-server \
    rsync \
    zsh \
    irssi \
    git \
    vim-nox \
    python3 \
    openssh-client \
    curl \
    tzdata \
    dumb-init \
    && apt-get -y install -t bullseye-backports \
    mercurial \
    mercurial-evolve \
    && rm -rf /var/lib/apt/lists/*
RUN cp /usr/share/zoneinfo/Europe/Paris /etc/localtime
RUN echo "Europe/Paris" > /etc/timezone
RUN mkdir -p /run/sshd
ENV LANG en_US.UTF-8
EXPOSE 22/tcp
CMD ["dumb-init", "--", "/usr/sbin/sshd", "-D", "-e"]
