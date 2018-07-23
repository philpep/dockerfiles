FROM r.philpep.org/alpine:3.8
RUN apk add --no-cache memcached
USER memcached
EXPOSE 11211/tcp
CMD ["memcached"]
