ARG REGISTRY
FROM $REGISTRY/debian:buster-slim
RUN apt-get update && apt-get -y install --no-install-recommends \
    postfix \
    postfix-pgsql \
    postfix-pcre \
    ca-certificates \
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
COPY master.cf main.cf pgsql-transport.cf pgsql-domain.cf \
     pgsql-mailbox.cf pgsql-alias.cf smtp_header_checks /etc/postfix/
RUN chown root:root /var/spool/postfix /var/spool/postfix/pid
COPY start.sh /
RUN chmod +x /start.sh
RUN mkdir -p /etc/ssl/postfix
CMD ["/start.sh"]
