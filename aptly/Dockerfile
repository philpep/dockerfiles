ARG REGISTRY
FROM $REGISTRY/debian:buster-slim
RUN apt-get -y update && \
	apt-get -y install aptly inoticoming gnupg && \
	rm -rf /var/lib/apt/lists/*
RUN useradd --home /var/lib/aptly --shell /bin/bash aptly
RUN mkdir -p /var/lib/aptly/incoming
RUN chown -R aptly:aptly /var/lib/aptly
COPY start.sh /
RUN chmod +x /start.sh
USER aptly
WORKDIR /var/lib/aptly
CMD ["/start.sh"]
