ARG REGISTRY
FROM $REGISTRY/debian:bullseye-slim
RUN apt-get update && apt-get -y install \
    rspamd \
    && rm -rf /var/lib/apt/lists/*
RUN echo 'filename = "/dev/stdout";' > /etc/rspamd/local.d/logging.inc
RUN echo 'local_addrs = [];' > /etc/rspamd/override.d/options.inc
COPY multimap.conf /etc/rspamd/local.d/multimap.conf
RUN mkdir /etc/rspamd/maps
COPY blacklist_domain.map /etc/rspamd/maps/
RUN sed -i 's@localhost:11334@*:11334@g' /etc/rspamd/rspamd.conf
RUN sed -i 's@localhost:11332@*:11332@g' /etc/rspamd/rspamd.conf
USER _rspamd
WORKDIR /var/lib/rspamd
CMD ["rspamd", "--no-fork", "--pid", "/dev/null"]
