FROM debian:stretch-slim
# This prevent broken installation of packages
RUN for i in $(seq 1 8); do mkdir -p /usr/share/man/man$i; done
RUN echo 'APT::Install-Recommends "0";' >> /etc/apt/apt.conf && \
    echo 'APT::Install-Suggests "0";' >> /etc/apt/apt.conf
RUN echo "deb http://deb.debian.org/debian stretch-backports main contrib non-free" > /etc/apt/sources.list.d/backports.list
RUN apt-get -y update && apt-get -y install wget ca-certificates gnupg && \
	wget -O - https://apt.philpep.org/key.asc | apt-key add - && \
	echo "deb http://apt.philpep.org stretch-backports main" > /etc/apt/sources.list.d/philpep.list && \
	apt-get -y purge wget ca-certificates gnupg && apt-get autoremove --purge -y
RUN apt-get -y update && apt-get -y upgrade
