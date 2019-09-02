ARG REGISTRY
FROM $REGISTRY/php-fpm
ARG VERSION=1.3.10
ARG DIST=roundcubemail-$VERSION-complete.tar.gz
ARG URL=https://github.com/roundcube/roundcubemail/releases/download/$VERSION/$DIST
ARG SHA512=8fffa16abda87d29081d1afedbf1d9e4862b8b1864785101d422e62048ca7f365c3708e8a76b4a37f716109230943bb9f03a5faa0cf3c3963fa5454207e00c49
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
