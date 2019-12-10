#!/bin/sh
set -e
if ! test -f ~/.gnupg/secring.gpg; then
    cat << EOF > gpg.batch
%echo Generating signing OpenPGP key
Key-Type: RSA
Key-Length: $GPG_SIZE
Key-Usage: sign
Subkey-Type: RSA
Subkey-Length: $GPG_SIZE
Subkey-Usage: sign
Name-Real: $GPG_NAME
Name-Email: $GPG_EMAIL
Expire-Date: 2y
%no-ask-passphrase
%no-protection
%commit
%echo done
EOF
    gpg1 --batch --gen-key gpg.batch
    mkdir -p ~/.aptly/public
fi
if ! test -f ~/.aptly/public/key.asc; then
    gpg1 --export --armor "$GPG_EMAIL" > ~/.aptly/public/key.asc
fi
case "$1" in
    api)
        exec aptly api serve --no-lock
        ;;
    upload)
        cd /usr/local/share/aptly && exec gunicorn3 --bind 0.0.0.0:5000 upload:app
        ;;
    *)
        echo "Usage: $0 api|upload"
        exit 1
        ;;
esac
