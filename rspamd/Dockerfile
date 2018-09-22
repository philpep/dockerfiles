ARG REGISTRY
FROM $REGISTRY/alpine:3.8
RUN apk add --no-cache rspamd
RUN ln -sf /dev/stdout /var/log/rspamd/rspamd.log
USER rspamd
WORKDIR /var/lib/rspamd
CMD ["rspamd", "--no-fork", "--pid", "/dev/null"]
