# https://redis.io/
#
# To disable persistence: redis-server --protected-mode no --appendfsync no --save ""
ARG REGISTRY
FROM $REGISTRY/debian:bullseye-slim
RUN apt-get update && apt-get -y install \
    redis-server \
    && rm -rf /var/lib/apt/lists/*
RUN sed -i "s@protected-mode yes@protected-mode no@g" /etc/redis/redis.conf
USER redis
WORKDIR /var/lib/redis
CMD ["redis-server"]
