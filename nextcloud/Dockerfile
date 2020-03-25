ARG REGISTRY
FROM $REGISTRY/php-fpm
USER root
RUN apk add --no-cache php7-posix php7-pcntl php7-intl php7-pecl-redis
ARG VERSION=18.0.3
ARG DIST=nextcloud-$VERSION.tar.bz2
ARG URL=https://download.nextcloud.com/server/releases/$DIST
ARG SHA512=b1f433dee2e7eea800de8cd8131332530050b6194460a397081a134f63b236f65e33758c60cd8e97a43570d0b6a1baac9e0503535d85a9a34cd63abd50041292
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
    ./occ app:install oidc_login && \
    ./occ app:install sentry && \
    rm -rf data config/config.php
