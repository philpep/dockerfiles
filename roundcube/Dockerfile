ARG REGISTRY
FROM $REGISTRY/php-fpm
ARG VERSION=1.4.2
ARG DIST=roundcubemail-$VERSION-complete.tar.gz
ARG URL=https://github.com/roundcube/roundcubemail/releases/download/$VERSION/$DIST
ARG SHA512=3f705bc38b44a0b7ea3241b0222f607b040ec01c8ea400b6b6222fbe346570c5f3450e5a188bab99ea171481453eb3f5b1e7457070ace1144558ec662a4273bb
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
