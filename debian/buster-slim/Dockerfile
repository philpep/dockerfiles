FROM debian:buster-slim
# This prevent broken installation of packages
RUN for i in $(seq 1 8); do mkdir -p /usr/share/man/man$i; done
RUN echo 'APT::Install-Recommends "0";' >> /etc/apt/apt.conf && \
    echo 'APT::Install-Suggests "0";' >> /etc/apt/apt.conf
RUN apt-get -y update && apt-get -y install \
	busybox \
	&& rm -rf /var/lib/apt/lists/*
RUN ln -s /bin/busybox /bin/ps && \
	ln -s /bin/busybox /bin/less && \
	ln -s /bin/busybox /bin/ping && \
	ln -s /bin/busybox /sbin/ip && \
	ln -s /bin/busybox /usr/bin/wget && \
	ln -s /bin/busybox /usr/bin/vi && \
	ln -s /bin/busybox /usr/bin/bc && \
	ln -s /bin/busybox /usr/bin/w && \
	ln -s /bin/busybox /usr/bin/uptime
RUN apt-get -y update && \
	apt-get -y upgrade && \
	rm -rf /var/lib/apt/lists/*
ENTRYPOINT ["bash"]
