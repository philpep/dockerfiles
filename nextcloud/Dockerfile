ARG REGISTRY
FROM $REGISTRY/php-fpm
USER root
RUN apt-get update && apt-get -y install \
    bzip2 \
    && rm -rf /var/lib/apt/lists/*
ARG VERSION=20.0.9
ARG DIST=nextcloud-$VERSION.tar.bz2
ARG URL=https://download.nextcloud.com/server/releases/$DIST
ARG SHA512=e37ee8874e73d340e7072afe1dc85ed798d5bd3dae4fc8d777bbbc8daa728a8eac260dca92441c269275c086f512881c837d767a860d5ee3bbc1abb445914e2d
RUN mkdir -p /data/nextcloud
RUN wget -O $DIST $URL && \
    echo "expected SHA512=$(sha512sum $DIST)" && \
    echo "$SHA512  $DIST" | sha512sum -c - && \
    tar -C /data/nextcloud --strip-components=1 -xf $DIST && \
    rm -f $DIST && \
    chown -R nobody:nogroup /data/nextcloud
RUN chmod +x /data/nextcloud/occ
USER nobody
WORKDIR /data/nextcloud
RUN ./occ maintenance:install --admin-pass=dummy --no-interaction && \
    ./occ app:update --all && \
    ./occ app:install calendar && \
    ./occ app:install oidc_login && \
    ./occ app:install sentry && \
    rm -rf data config/config.php
