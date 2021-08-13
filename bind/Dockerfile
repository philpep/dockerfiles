# https://www.isc.org/bind/
#
# docker run --rm -it --name bind \
#   -v /path/named.conf.local:/etc/bind/named.conf.local
#   -v /path/zones:/var/run/named/zones
# (to use dynamic zones, zones directory must be chown -R 101:101)
ARG REGISTRY
FROM $REGISTRY/debian:bullseye-slim
RUN apt-get update && apt-get -y install \
    bind9 \
    && rm -rf /var/lib/apt/lists/*
RUN rm -rf /etc/bind/*
COPY named.conf rndc.conf /etc/bind/
RUN touch /etc/bind/rndc-key.key \
    /etc/bind/named.conf.local
RUN chown bind:bind /etc/bind/rndc-key.key
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
USER bind
WORKDIR /etc/bind
ENTRYPOINT ["/entrypoint.sh"]
CMD ["named", "-g"]
