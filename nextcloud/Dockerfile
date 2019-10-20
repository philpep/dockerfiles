ARG REGISTRY
FROM $REGISTRY/php-fpm
USER root
RUN apk add --no-cache php7-posix php7-pcntl php7-intl
ARG VERSION=17.0.0
ARG DIST=nextcloud-$VERSION.tar.bz2
ARG URL=https://download.nextcloud.com/server/releases/$DIST
ARG SHA512=d271d6220c72473f0ccc1ca776fb883e0d2cf4e338a7aa0143cce8d8ffeecf825eb5e41d42467d22922995dc6adb2751831158923e0dea29405dbb11bea85b04
RUN mkdir -p /data/nextcloud
RUN wget -O $DIST $URL && \
    echo "expected SHA512=$(sha512sum $DIST)" && \
    echo "$SHA512  $DIST" | sha512sum -c - && \
    tar -C /data/nextcloud --strip-components=1 -xf $DIST && \
    rm -f $DIST && \
    chown -R nobody:nobody /data/nextcloud
RUN chmod +x /data/nextcloud/occ
USER nobody
WORKDIR /data/nextcloud
RUN ./occ maintenance:install --admin-pass=dummy --no-interaction && \
    ./occ app:update --all && \
    ./occ app:install calendar && \
    rm -rf data config/config.php
