# https://redis.io/
#
# To disable protected mode: redis-server --protected-mode no
# To disable persistence: redis-server --appendfsync no --save ""
ARG REGISTRY
FROM $REGISTRY/debian:buster-slim
RUN apt-get update && apt-get -y install \
    redis-server \
    && rm -rf /var/lib/apt/lists/*
USER redis
WORKDIR /var/lib/redis
CMD ["redis-server"]
