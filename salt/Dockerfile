FROM r.philpep.org/alpine:3.8
RUN apk add --no-cache salt-master
RUN adduser -D salt
RUN mkdir -p /var/cache/salt /var/run/salt
RUN chown -R salt:salt /etc/salt /var/cache/salt /var/run/salt /var/log/salt
USER salt
WORKDIR /home/salt
EXPOSE 4505 4506
CMD ["salt-master", "--pid-file=/dev/null", "--log-file=/dev/stdout"]
