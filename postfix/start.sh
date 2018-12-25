#!/usr/bin/dumb-init /bin/sh
set -e
if [ ! -s /etc/ssl/postfix/tls.key ] || [ ! -s /etc/ssl/postfix/tls.crt ]; then
    echo "Generating self-signed certificate"
    openssl req -x509 -sha256 -nodes -newkey rsa:4096 -keyout /etc/ssl/postfix/tls.key -out /etc/ssl/postfix/tls.crt -days 365 -subj '/CN=localhost'
    chmod 600 /etc/ssl/postfix/tls.key
fi
if [ ! -s /etc/ssl/postfix/dh1024.pem ]; then
    echo "Generating dh1024.pem"
    openssl dhparam -out /etc/ssl/postfix/dh1024.pem 1024
fi
if [ ! -s /etc/ssl/postfix/dh512.pem ]; then
    echo "Generating dh512.pem"
    openssl dhparam -out /etc/ssl/postfix/dh512.pem 512
fi
for fname in /etc/postfix/pgsql-transport.cf /etc/postfix/pgsql-domain.cf /etc/postfix/pgsql-mailbox.cf /etc/postfix/pgsql-alias.cf; do
    sed -i "s/@@MAILSERVER_DB_USER@@/$MAILSERVER_DB_USER/g" $fname
    sed -i "s/@@MAILSERVER_DB_PASSWORD@@/$MAILSERVER_DB_PASSWORD/g" $fname
    sed -i "s/@@MAILSERVER_DB_HOST@@/$MAILSERVER_DB_HOST/g" $fname
    sed -i "s/@@MAILSERVER_DB_NAME@@/$MAILSERVER_DB_NAME/g" $fname
done
sed -i "s/@@MAILSERVER_HOSTNAME@@/$MAILSERVER_HOSTNAME/g" /etc/postfix/main.cf
sed -i "s/@@MAILSERVER_MASQUERADE_DOMAINS@@/$MAILSERVER_MASQUERADE_DOMAINS/g" /etc/postfix/main.cf
rsyslogd -n &
exec postfix start-fg
