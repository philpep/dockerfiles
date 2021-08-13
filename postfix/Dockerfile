ARG REGISTRY
FROM $REGISTRY/debian:bullseye-slim
RUN apt-get update && apt-get -y install \
    postfix \
    postfix-pgsql \
    postfix-pcre \
    openssl \
    && rm -rf /var/lib/apt/lists/*
RUN addgroup --gid 425 --system vmail
RUN useradd --home /var/lib/vmail --create-home --system --uid 425 --gid 425 vmail
RUN install -o vmail -g vmail -d /var/lib/vmail
ENV MAILSERVER_DB_USER=postgres
ENV MAILSERVER_DB_PASSWORD=postgres
ENV MAILSERVER_DB_HOST=localhost
ENV MAILSERVER_DB_NAME=postgres
ENV MAILSERVER_HOSTNAME=smtp.example.com
ENV MAILSERVER_MASQUERADE_DOMAINS=example.com
ENV MAILSERVER_SMTPD_MILTERS=inet:localhost:11332
ENV MAILSERVER_VIRTUAL_TRANSPORT=lmtp:inet:localhost:24
ENV MAILSERVER_SMTPD_SASL_PATH=inet:localhost:9993
COPY master.cf main.cf pgsql-transport.cf pgsql-domain.cf \
     pgsql-mailbox.cf pgsql-alias.cf smtp_header_checks /etc/postfix/
RUN chown root:root /var/spool/postfix /var/spool/postfix/pid
COPY start.sh /
RUN chmod +x /start.sh
RUN mkdir -p /etc/ssl/postfix
CMD ["/start.sh"]
