FROM debian:bookworm-slim
# This prevent broken installation of packages
RUN for i in $(seq 1 8); do mkdir -p /usr/share/man/man$i; done
RUN echo 'APT::Install-Recommends "0";' >> /etc/apt/apt.conf && \
    echo 'APT::Install-Suggests "0";' >> /etc/apt/apt.conf
RUN apt-get -y update && apt-get -y install \
    busybox \
    wget \
    ca-certificates \
    gnupg \
    && rm -rf /var/lib/apt/lists/*
RUN ln -s /bin/busybox /bin/ps && \
    ln -s /bin/busybox /bin/less && \
    ln -s /bin/busybox /bin/ping && \
    ln -s /bin/busybox /sbin/ip && \
    ln -s /bin/busybox /usr/bin/vi && \
    ln -s /bin/busybox /usr/bin/bc && \
    ln -s /bin/busybox /usr/bin/w && \
    ln -s /bin/busybox /usr/bin/uptime
RUN wget -O /etc/apt/trusted.gpg.d/philpep.asc https://apt.philpep.org/key.asc
RUN echo "deb https://apt.philpep.org bookworm-backports main" > /etc/apt/sources.list.d/philpep.list
RUN echo "deb http://deb.debian.org/debian bookworm-backports main contrib non-free" > /etc/apt/sources.list.d/backports.list
RUN apt-get -y update && \
    apt-get -y upgrade && \
    rm -rf /var/lib/apt/lists/*
CMD ["bash"]
