ARG REGISTRY
FROM $REGISTRY/alpine:3.10
RUN apk add --no-cache memcached
USER memcached
EXPOSE 11211/tcp
CMD ["memcached"]
