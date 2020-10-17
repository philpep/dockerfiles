ARG REGISTRY
FROM $REGISTRY/debian:buster-slim
RUN echo "deb http://deb.debian.org/debian buster-backports main contrib non-free" > /etc/apt/sources.list.d/backports.list
RUN apt-get update && apt-get -y install -t buster-backports --no-install-recommends \
    rspamd \
    && rm -rf /var/lib/apt/lists/*
RUN echo 'filename = "/dev/stdout";' > /etc/rspamd/local.d/logging.inc
RUN echo 'local_addrs = [];' > /etc/rspamd/override.d/options.inc
COPY multimap.conf /etc/rspamd/local.d/multimap.conf
RUN mkdir /etc/rspamd/maps
COPY blacklist_domain.map /etc/rspamd/maps/
RUN sed -i 's@localhost:11334@*:11334@g' /etc/rspamd/rspamd.conf
USER _rspamd
WORKDIR /var/lib/rspamd
CMD ["rspamd", "--no-fork", "--pid", "/dev/null"]
