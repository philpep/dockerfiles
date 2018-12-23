ARG REGISTRY
FROM $REGISTRY/alpine:3.8
RUN apk add --no-cache \
    postfix \
    postfix-pgsql \
    postfix-pcre \
    ca-certificates \
    openssl \
    dumb-init \
    rsyslog
RUN deluser vmail
RUN addgroup -g 425 -S vmail
RUN adduser -h /var/lib/vmail -S -D -H -u 425 -G vmail vmail
RUN install -o vmail -g vmail -d /var/lib/vmail
ENV MAILSERVER_DB_USER=postgres
ENV MAILSERVER_DB_PASSWORD=postgres
ENV MAILSERVER_DB_HOST=localhost
ENV MAILSERVER_DB_NAME=postgres
ENV MAILSERVER_HOSTNAME=smtp.example.com
ENV MAILSERVER_MASQUERADE_DOMAINS=example.com
COPY master.cf main.cf pgsql-transport.cf pgsql-domain.cf \
     pgsql-mailbox.cf pgsql-alias.cf /etc/postfix/
RUN chown root:root /var/spool/postfix /var/spool/postfix/pid
COPY rsyslog.conf /etc/rsyslog.conf
COPY start.sh /
RUN chmod +x /start.sh
RUN mkdir -p /etc/ssl/postfix
CMD ["/start.sh"]
