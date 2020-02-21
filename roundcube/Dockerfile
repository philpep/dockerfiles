ARG REGISTRY
FROM $REGISTRY/php-fpm
ARG VERSION=1.4.3
ARG DIST=roundcubemail-$VERSION-complete.tar.gz
ARG URL=https://github.com/roundcube/roundcubemail/releases/download/$VERSION/$DIST
ARG SHA512=c65359473d08a46dbd42894c2758a46209491fc421ee58ab5b1c0d0d56e3fec8b2f43d01b18cb8934589cbee7e7abfda2c8efbf02b3521790d7b45ed6dc88a1e
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
