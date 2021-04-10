ARG REGISTRY
FROM $REGISTRY/debian:buster-slim
RUN apt-get update && apt-get -y install --no-install-recommends \
    bind9-host \
    curl \
    ca-certificates \
    httpie \
    jq \
    mariadb-client \
    postgresql-client \
    rsync \
    && rm -rf /var/lib/apt/lists/*
