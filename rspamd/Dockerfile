ARG REGISTRY
FROM $REGISTRY/alpine:3.8
RUN apk add --no-cache \
    rspamd \
    rspamd-controller \
    rspamd-proxy
RUN echo -e 'filename = "/dev/stdout";' > /etc/rspamd/local.d/logging.inc
USER rspamd
WORKDIR /var/lib/rspamd
CMD ["rspamd", "--no-fork", "--pid", "/dev/null"]
