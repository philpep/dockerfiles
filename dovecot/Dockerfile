ARG REGISTRY
FROM $REGISTRY/debian:bullseye-slim
RUN apt-get update && apt-get -y install \
    dovecot-core \
    dovecot-imapd \
    dovecot-pop3d \
    dovecot-pgsql \
    dovecot-sieve \
    dovecot-lmtpd \
    ssl-cert \
    dumb-init \
    rspamd \
    && rm -rf /var/lib/apt/lists/*
RUN mkdir /etc/ssl/dovecot
RUN cp /etc/ssl/private/ssl-cert-snakeoil.key /etc/ssl/dovecot/tls.key && \
    cp /etc/ssl/certs/ssl-cert-snakeoil.pem /etc/ssl/dovecot/tls.crt
RUN addgroup --gid 425 --system vmail
RUN useradd --home /var/lib/vmail --create-home --system --uid 425 --gid 425 vmail
RUN install -o vmail -g vmail -d /var/lib/vmail
COPY dovecot.conf dovecot-dict-quota.conf dovecot-sql.conf rspamd.sieve /etc/dovecot/
RUN cd /etc/dovecot && sievec rspamd.sieve
COPY report-spam.sieve report-ham.sieve learn-spam.sh learn-ham.sh /usr/lib/dovecot/sieve/
RUN cd /usr/lib/dovecot/sieve && \
    chmod +x learn-spam.sh learn-ham.sh && \
    sievec report-spam.sieve && \
    sievec report-ham.sieve
ENV MAILSERVER_DB_USER=postgres
ENV MAILSERVER_DB_PASSWORD=postgres
ENV MAILSERVER_DB_HOST=localhost
ENV MAILSERVER_DB_NAME=postgres
ENV RSPAMD_HOSTNAME=localhost
COPY start.sh /
RUN chmod +x /start.sh
CMD ["/start.sh"]
