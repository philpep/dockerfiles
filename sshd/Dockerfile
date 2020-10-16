ARG REGISTRY
FROM $REGISTRY/debian:buster-slim
RUN apt-get update && apt-get -y install --no-install-recommends \
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
    gnupg \
    tzdata \
    dumb-init \
    && rm -rf /var/lib/apt/lists/*
RUN cp /usr/share/zoneinfo/Europe/Paris /etc/localtime
RUN echo "Europe/Paris" > /etc/timezone
RUN wget -O - https://apt.philpep.org/key.asc | apt-key --keyring /etc/apt/trusted.gpg.d/philpep.gpg add -
RUN echo "deb http://apt.philpep.org buster-backports main" > /etc/apt/sources.list.d/philpep.list
RUN apt-get update && apt-get -y install -t buster-backports --no-install-recommends \
    mercurial \
    mercurial-evolve \
    && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /run/sshd
ENV LANG en_US.UTF-8
EXPOSE 22/tcp
CMD ["dumb-init", "--", "/usr/sbin/sshd", "-D", "-e"]
