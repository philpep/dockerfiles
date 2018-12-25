ARG REGISTRY
FROM $REGISTRY/alpine:3.8
RUN apk add --no-cache \
    dovecot \
    dovecot-pgsql \
    dovecot-pigeonhole-plugin \
    rspamd-client \
    dumb-init
RUN mv /etc/ssl/dovecot/server.key /etc/ssl/dovecot/tls.key && \
    mv /etc/ssl/dovecot/server.pem /etc/ssl/dovecot/tls.crt
RUN addgroup -g 425 -S vmail
RUN adduser -h /var/lib/vmail -S -D -H -u 425 -G vmail vmail
RUN install -o vmail -g vmail -d /var/lib/vmail
COPY dovecot.conf dovecot-dict-quota.conf dovecot-sql.conf rspamd.sieve /etc/dovecot/
RUN cd /etc/dovecot && sievec rspamd.sieve
ENV MAILSERVER_DB_USER=postgres
ENV MAILSERVER_DB_PASSWORD=postgres
ENV MAILSERVER_DB_HOST=localhost
ENV MAILSERVER_DB_NAME=postgres
COPY start.sh /
RUN chmod +x /start.sh
CMD ["/start.sh"]
