# https://redis.io/
#
# To disable protected mode: redis-server --protected-mode no
# To disable persistence: redis-server --appendfsync no --save ""
ARG REGISTRY
FROM $REGISTRY/alpine:3.10
RUN apk add --no-cache redis 
USER redis
WORKDIR /var/lib/redis
CMD ["redis-server"]
