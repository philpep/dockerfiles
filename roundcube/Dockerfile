ARG REGISTRY
FROM $REGISTRY/php-fpm
ARG VERSION=1.4.1
ARG DIST=roundcubemail-$VERSION-complete.tar.gz
ARG URL=https://github.com/roundcube/roundcubemail/releases/download/$VERSION/$DIST
ARG SHA512=0c8e09e93c86aad0f3e3a5a81c5e9ad8ab8aee101ae8ebb78d29556575db94a51a07cbf955ec79235425a961427b826ad27fae750b8eae785eedd195161dabed
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
