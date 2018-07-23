FROM r.philpep.org/alpine:3.8
RUN apk add --no-cache bind
RUN touch /etc/bind/named.conf
RUN chown -R named:named /etc/bind
USER named
WORKDIR /etc/bind
CMD ["named", "-g", "-4"]
