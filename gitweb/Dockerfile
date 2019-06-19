ARG REGISTRY
FROM $REGISTRY/alpine:3.10
RUN apk add --no-cache git fcgiwrap spawn-fcgi cgit
ADD cgitrc /etc/cgitrc
RUN mkdir /repos
WORKDIR /run/fcgiwrap
USER fcgiwrap
EXPOSE 9000/tcp
CMD ["spawn-fcgi", "-p", "9000", "-n", "--", "/usr/bin/fcgiwrap"]
