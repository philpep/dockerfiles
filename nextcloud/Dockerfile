ARG REGISTRY
FROM $REGISTRY/php-fpm
USER root
RUN apt-get update && apt-get -y install \
    bzip2 \
    && rm -rf /var/lib/apt/lists/*
ARG VERSION=20.0.11
ARG DIST=nextcloud-$VERSION.tar.bz2
ARG URL=https://download.nextcloud.com/server/releases/$DIST
ARG SHA512=4863a7819a564655db0a7b49a7ca9be642ab5383cdeada5c3ce6fc4529fda522a4427eb4b3ba5e00e4719232fed6c1f9e606e11f38c35f8838f82247359f335b
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
