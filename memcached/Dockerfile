ARG REGISTRY
FROM $REGISTRY/debian:buster-slim
RUN apt-get update && apt-get -y install --no-install-recommends \
    memcached \
    && rm -rf /var/lib/apt/lists/*
USER memcache
EXPOSE 11211/tcp
CMD ["memcached"]
