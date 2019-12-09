FROM debian:buster-slim
# This prevent broken installation of packages
RUN for i in $(seq 1 8); do mkdir -p /usr/share/man/man$i; done
RUN echo 'APT::Install-Recommends "0";' >> /etc/apt/apt.conf && \
    echo 'APT::Install-Suggests "0";' >> /etc/apt/apt.conf
RUN apt-get -y update && apt-get -y upgrade
