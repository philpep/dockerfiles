ARG REGISTRY
FROM $REGISTRY/php-fpm
ARG VERSION=1.3.9
ARG DIST=roundcubemail-$VERSION-complete.tar.gz
ARG URL=https://github.com/roundcube/roundcubemail/releases/download/$VERSION/$DIST
ARG SHA512=42ae9b772272b3e82476beeeb0fc5a909fb07ed0bfbdb655627b1e31da1c292f67f5a305452de31b2d60fe5905bcacabd6874dea394a9b0fd66b7921d73500ac
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
