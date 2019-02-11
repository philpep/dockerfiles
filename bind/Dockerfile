ARG REGISTRY
FROM $REGISTRY/alpine:3.9
RUN apk add --no-cache bind
RUN touch /etc/bind/named.conf
RUN chown -R named:named /etc/bind
USER named
WORKDIR /etc/bind
CMD ["named", "-g", "-4"]
