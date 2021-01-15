ARG REGISTRY
FROM $REGISTRY/php-fpm
ARG VERSION=1.4.10
ARG DIST=roundcubemail-$VERSION-complete.tar.gz
ARG URL=https://github.com/roundcube/roundcubemail/releases/download/$VERSION/$DIST
ARG SHA512=e0a661ae5b928ce2c93129775d32a679ad2512ca4af21e8dd1711d38a62818ff9ee1e1fc922aae68e0a8bca034ca780fc3e3e988731a2ce9b2190b2c1d8e08a6
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
