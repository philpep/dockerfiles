ARG REGISTRY
FROM $REGISTRY/php-fpm
ARG VERSION=1.4.7
ARG DIST=roundcubemail-$VERSION-complete.tar.gz
ARG URL=https://github.com/roundcube/roundcubemail/releases/download/$VERSION/$DIST
ARG SHA512=d668075c1fb1ac48931a82ca67b4ebeed6f1d1e82a336901f79967cb2eb91979fc7bb46d4895558f8e64f89f963002efc7c1ad23b93c52a252ce1a7aa04b678a
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
