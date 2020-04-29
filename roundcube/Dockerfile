ARG REGISTRY
FROM $REGISTRY/php-fpm
ARG VERSION=1.4.4
ARG DIST=roundcubemail-$VERSION-complete.tar.gz
ARG URL=https://github.com/roundcube/roundcubemail/releases/download/$VERSION/$DIST
ARG SHA512=ddea321b5266c547f67c010147e9aa1457bea4802bec37f9e9d87e691bdc8df27f5c90cff8770de2458822160b85f7359f62742072ae1d642a040b9d88651519
USER root
# for password plugin
RUN apk add --no-cache dovecot
RUN mkdir -p /data/roundcube
RUN wget -O $DIST $URL && \
    echo "expected SHA512=$(sha512sum $DIST)" && \
    echo "$SHA512  $DIST" | sha512sum -c - && \
    tar -C /data/roundcube --strip-components=1 -xvzf $DIST && \
    rm -f $DIST && \
    chown -R nobody:nobody /data/roundcube
COPY index.html rc.png robots.txt /data/
USER nobody
