FROM r.philpep.org/alpine:3.8
RUN apk add --no-cache awstats fcgiwrap spawn-fcgi
USER fcgiwrap
WORKDIR /run/fcgiwrap
EXPOSE 9000/tcp
CMD ["spawn-fcgi", "-p", "9000", "-n", "--", "/usr/bin/fcgiwrap"]
