#!/usr/bin/dumb-init /bin/sh
set -e
for fname in /etc/dovecot/dovecot-dict-quota.conf /etc/dovecot/dovecot-sql.conf; do
    sed -i "s/@@MAILSERVER_DB_USER@@/$MAILSERVER_DB_USER/g" $fname
    sed -i "s/@@MAILSERVER_DB_PASSWORD@@/$MAILSERVER_DB_PASSWORD/g" $fname
    sed -i "s/@@MAILSERVER_DB_HOST@@/$MAILSERVER_DB_HOST/g" $fname
    sed -i "s/@@MAILSERVER_DB_NAME@@/$MAILSERVER_DB_NAME/g" $fname
done
exec dovecot -F -c /etc/dovecot/dovecot.conf
