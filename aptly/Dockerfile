ARG REGISTRY
FROM $REGISTRY/debian:bullseye-slim
RUN apt-get -y update && apt-get -y install \
    aptly \
    gnupg1 \
    gpgv1 \
    graphviz \
    uuid-runtime \
    python3-flask \
    python3-lxml \
    gunicorn3 \
    && rm -rf /var/lib/apt/lists/*
RUN useradd --home /var/lib/aptly --shell /bin/bash aptly
RUN mkdir -p /var/lib/aptly/incoming
RUN chown -R aptly:aptly /var/lib/aptly
COPY upload.py /usr/local/share/aptly/
COPY aptly-include aptly-snapshot-cleanup aptly-mirror-update /usr/local/bin/
RUN chmod +x /usr/local/bin/aptly-*
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
USER aptly
WORKDIR /var/lib/aptly
COPY aptly.conf .aptly.conf
ENV GPG_SIZE=4096
ENV GPG_NAME="Automatic Signing Key"
ENV GPG_EMAIL="debian@example.com"
ENTRYPOINT ["/entrypoint.sh"]
CMD ["upload"]
