ARG REGISTRY
FROM $REGISTRY/php-fpm
ARG VERSION=1.5.2
ARG DIST=roundcubemail-$VERSION-complete.tar.gz
ARG URL=https://github.com/roundcube/roundcubemail/releases/download/$VERSION/$DIST
ARG SHA512=96faa8c95c23b538ebfa91f58fb918b37185dbd1c09f2d128c9f8c800a0e3d6a2abbfa52753fb6a7ee47b633f35e2b31c92623107116dc760dfa9a22a4b2a23c
USER root
# dovecotpw for password generation
RUN apt-get update && apt-get -y install \
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
