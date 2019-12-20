ARG REGISTRY
FROM $REGISTRY/alpine:3.11
RUN apk add --no-cache memcached
USER memcached
EXPOSE 11211/tcp
CMD ["memcached"]
