ARG REGISTRY
FROM $REGISTRY/debian:bullseye-slim
RUN apt-get update && apt-get -y install \
    memcached \
    && rm -rf /var/lib/apt/lists/*
USER memcache
EXPOSE 11211/tcp
CMD ["memcached"]
