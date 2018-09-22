ARG REGISTRY
FROM $REGISTRY/alpine:3.8
RUN apk add --no-cache salt-master salt-ssh openssh-client
RUN adduser -D salt
RUN mkdir -p /var/cache/salt /var/run/salt
RUN chown -R salt:salt /etc/salt /var/cache/salt /var/run/salt /var/log/salt
COPY issue47006.patch salt-ssh.patch /tmp/
RUN cd //usr/lib/python3.6/site-packages/salt && \
    patch -p0 < /tmp/issue47006.patch && \
    patch -p0 < /tmp/salt-ssh.patch
USER salt
WORKDIR /home/salt
EXPOSE 4505 4506
CMD ["salt-master", "--pid-file=/dev/null", "--log-file=/dev/stdout"]
