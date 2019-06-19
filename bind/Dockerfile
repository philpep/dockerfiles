# https://www.isc.org/bind/
#
# docker run --rm -it --name bind \
#   -v /path/named.conf.local:/etc/bind/named.conf.local
#   -v /path/zones:/var/run/named/zones
# (to use dynamic zones, zones directory must be chown -R 100:101)
ARG REGISTRY
FROM $REGISTRY/alpine:3.10
RUN apk add --no-cache bind bind-tools
RUN rm -rf /etc/bind/*
COPY named.conf rndc.conf /etc/bind/
RUN touch /etc/bind/rndc-key.key \
    /etc/bind/named.conf.local
RUN chown named:named /etc/bind/rndc-key.key
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
USER named
WORKDIR /etc/bind
ENTRYPOINT ["/entrypoint.sh"]
CMD ["named", "-g"]
