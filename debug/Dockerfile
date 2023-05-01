ARG REGISTRY
FROM $REGISTRY/debian:bookworm-slim
RUN apt-get update && apt-get -y install \
    bind9-host \
    curl \
    httpie \
    jq \
    mariadb-client \
    postgresql-client \
    rsync \
    && rm -rf /var/lib/apt/lists/*
