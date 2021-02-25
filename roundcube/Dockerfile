ARG REGISTRY
FROM $REGISTRY/php-fpm
ARG VERSION=1.4.11
ARG DIST=roundcubemail-$VERSION-complete.tar.gz
ARG URL=https://github.com/roundcube/roundcubemail/releases/download/$VERSION/$DIST
ARG SHA512=2bfe0ff3716f76bf9eb5bf5f7b62c738b233c57e67d6ac767c044d1a3a694ae003642d9cc68a18d6f6ba94135aa7ee1692db920e9127128669faee9ddf78fe80
USER root
# dovecotpw for password generation
RUN apt-get update && apt-get -y install --no-install-recommends \
    dovecot-core \
    && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /data/roundcube
RUN wget -O $DIST $URL && \
    echo "expected SHA512=$(sha512sum $DIST)" && \
    echo "$SHA512  $DIST" | sha512sum -c - && \
    tar -C /data/roundcube --strip-components=1 -xvzf $DIST && \
    rm -f $DIST && \
    chown -R nobody:nogroup /data/roundcube
COPY index.html rc.png robots.txt /data/
USER nobody
