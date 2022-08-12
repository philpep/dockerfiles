ARG REGISTRY
FROM $REGISTRY/php-fpm
ARG VERSION=1.6.0
ARG DIST=roundcubemail-$VERSION-complete.tar.gz
ARG URL=https://github.com/roundcube/roundcubemail/releases/download/$VERSION/$DIST
ARG SHA512=821733778085c670caeed6bed515e542841920dccc21e2ca97088e1f77a302b6961234d6ee5bcfbda797470889747a3be2c6d13cc5016615c8919c7ea064108c
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
