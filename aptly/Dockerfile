ARG REGISTRY
FROM $REGISTRY/debian:stretch-slim
RUN apt-get -y update && \
	apt-get -y -t stretch-backports install aptly && \
	apt-get -y install inoticoming gnupg
RUN useradd --home /var/lib/aptly --shell /bin/bash aptly
RUN mkdir -p /var/lib/aptly/incoming
RUN chown -R aptly:aptly /var/lib/aptly
COPY start.sh /
RUN chmod +x /start.sh
USER aptly
WORKDIR /var/lib/aptly
CMD ["/start.sh"]
