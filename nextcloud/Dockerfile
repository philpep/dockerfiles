ARG REGISTRY
FROM $REGISTRY/php-fpm
USER root
RUN apt-get update && apt-get -y install --no-install-recommends \
    bzip2 \
    && rm -rf /var/lib/apt/lists/*
ARG VERSION=20.0.1
ARG DIST=nextcloud-$VERSION.tar.bz2
ARG URL=https://download.nextcloud.com/server/releases/$DIST
ARG SHA512=9e343872b00578c442d11da81d5d97d46b70df3a86b2d081283fb8670301792bc0f977f4b854ebc2b505b8c00bd8a70170b0ce721493dcad3ae6ef0cdd3e4ddc
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
