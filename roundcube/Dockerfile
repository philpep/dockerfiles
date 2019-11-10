ARG REGISTRY
FROM $REGISTRY/php-fpm
ARG VERSION=1.4.0
ARG DIST=roundcubemail-$VERSION-complete.tar.gz
ARG URL=https://github.com/roundcube/roundcubemail/releases/download/$VERSION/$DIST
ARG SHA512=274372793f1f3af761702f8972f6360f8c8e64a705ff96f1432f6a520d24c9ca0e8ccc3933f26433f1c864bd6c381066fc9eb48bf97e9497b4cbff855412d811
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
