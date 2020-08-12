ARG REGISTRY
FROM $REGISTRY/php-fpm
ARG VERSION=1.4.8
ARG DIST=roundcubemail-$VERSION-complete.tar.gz
ARG URL=https://github.com/roundcube/roundcubemail/releases/download/$VERSION/$DIST
ARG SHA512=8b7734cdec95954b7e18a0e44957da6ef74b5b0c3d28a1449e8634faa230844f5e0c28954245641758f8b2d9102aa32f279765ed3dfa20fa7b00dee4e5347362
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
